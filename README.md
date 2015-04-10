# Pyramid client

A client to access pyramid lib API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pyramid-client'
```

## Usage example

```ruby
Pyramid.configure do |config|
  config.app_id     app_id
  config.app_secret app_secret
end

client = Pyramid::Client.new(app_id, app_secret)

entity = Pyramid::Entity.new('xyz123', client)
entity.add_points(100)
entity.create_action_event('retweet')

entity = Pyramid::Entity.find('xyz123')
entity.redeem_reward(reward_id)
```
