require "padrino/env/version"
require "erb"
require "yaml"

module Padrino
  module Env

  	class Application

		def self.load(options = {})
			new(options).load
		end

		def initialize(options = {})
			@path = options.fetch(:path, 'config/application.yml')
			@environment = options.fetch(:environment, Padrino.env)
		end

		def set(key, value)
			non_string_configuration!(key) unless key.is_a?(String)
			non_string_configuration!(value) unless value.is_a?(String)
			::ENV[key.to_s] = value.to_s
		end
		
		def skip?(key)
			::ENV.key?(key.to_s)
		end

		def environment
			@environment.to_s
		end

		def configuration
			global_configuration.merge(environment_configuration)
		end

		def load
			each do |key, value|
				set(key, value) unless skip?(key)
			end
		end

		def each(&block)
			configuration.each(&block)
		end

		def path
			Padrino.root(@path)
		end

		def raw_configuration
      		@parsed ||= parse(path)
    	end

		def global_configuration
			raw_configuration.reject { |_, value| value.is_a?(Hash) }
		end

		def environment_configuration
			raw_configuration.fetch(environment) { {} }
		end

	  	def parse(path)
	  		return (YAML.load(ERB.new(File.read(path)).result) || {}) if File.exist?(path)
	  		{}
	  	end

		def non_string_configuration!(value)
			warn "WARNING: Use strings for Figaro configuration. #{value.inspect} was converted to #{value.to_s.inspect}."
		end

	 end

  end
end
