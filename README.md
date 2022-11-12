# Roda plugin for ScoutApm instrumentation

This plugin adds [ScoutApm](https://scoutapm.com/) instrumentation to [Roda](https://github.com/jeremyevans/roda) applications.

It uses ScoutApm [Rack instrumentation ](https://scoutapm.com/docs/ruby/rack)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add roda-scoutapm

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install roda-scoutapm

## Usage

First, you need to add credentials to config/scout_apm.yml or ENV variables as ScoutApm requires.

Than you need to add the ScoutApm::Rack.install! startup call as close to the spot you run your Rack application as possible. install! should be called after you require other gems (ActiveRecord, Mongo, etc) to install instrumentation for those libraries.

```ruby
#config.ru
require_relative 'app'

require 'scout_apm'
ScoutApm::Rack.install!

run App
```

```ruby
class App < Roda
  plugin :scoutapm

  route do |r|
    r.is 'foo' do
      r.get do
        'hello world'
      end
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Alexey2257/roda-scoutapm.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
