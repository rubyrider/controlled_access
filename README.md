# ControlledAccess
Complex platforms require dynamic role based access control system 
where permission set is composed based on dynamic permission sets. Provides essential 
helpers to load services like decorators, serializers etc etc. Highly configurable, 
integration is easy.

## Usage
```ruby
  ControlledAccess.setup do |configuration|
    configuration.enabled = true # you can disable temporary
    configuration.permission_table = 'permissions'.freeze
    configuration.permission_model = -> { FakePermission }
    configuration.auto_authorisation = true
    configuration.authorization_adapter = :pundit # cancan is also available
  end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'controlled_access'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install controlled_access:install
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
