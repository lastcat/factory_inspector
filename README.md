# FactoryInspector

This gem help you getting infos about factory which you execute.For more detail, See <blog url>.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory_inspector'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install factory_inspector

## Usage

 1. You need to modify factory girl's code as follows.

 ```.rb
 #@ lib/factory_girl/factory_runnner.rb

 instrumentation_payload = { name: @name, strategy: runner_strategy, traits: @traits.to_s, overrides: @overrides, factory: factory}

 ```

 and your app's code, (plobably, at `/config/initializers/notification.rb` if your app is rails app)

 ```.rb
 factory_info = FactoryInspector.factory_inspect(payload[:factory])
 traits_info = FactoryInspector.traits_inspect(payload[:traits])
 ```

 so, you can get some info about factory from simple hash object.


## Contributing

1. Fork it ( https://github.com/[my-github-username]/factory_inspector/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
