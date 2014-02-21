# Padrino::Env

Reads an application.yml and sets ENV vars.  Most of the code is borrowed from https://github.com/laserlemon/figaro

## Installation

Add this line to your application's Gemfile:

    gem 'padrino-env'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install padrino-env

## Usage

Create a config/application.yml

Then in your config/boot.rb file:

	Padrino.before_load do
	  Padrino::Env::Application.load(environment: Padrino.env)
	end

## Todos

1. Add specs


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
