# Tz

Displays UTC time/datatime objects in a specified timezone.

## Installation

Add this line to your application's Gemfile:

    gem 'tz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tz

## Usage

```ruby
TZ::TimeWithZone.new(Time.now).in_time_zone("Eastern Time (US & Canada)")
# => "Sat, 07 Jun 2014 17:23:53 EDT -04:00"
```

## Contributing

1. Fork it ( https://github.com/wecodeio/tz/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
