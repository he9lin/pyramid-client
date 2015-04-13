# Pyramid client

A client to access pyramid lib API. (functional style :p)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pyramid-client'
```

## Usage example

```ruby
Pyramid.configure do |c|
  c.api_root   = 'http://localhost:3000'
  c.app_key    = YOUR_APP_KEY
  c.app_secret = YOUR_APP_SECRET
end

client = Pyramid::Client.new(app_id, app_secret)
entity = Pyramid::Entity.new(uname: 'xyz123')
entity.add_points(100)
entity = Pyramid::Entity.find('xyz123')
entity.add_points(100)

# RESTful
entity_action = Pyramid::EntityAction.new(name: "tweet", value: 100)
entity_action.save
entity_action.name = "retweet"
entity_action.save
entity_action.destroy

reward_item = Pyramid::RewardItem.new(entity_id: entity_id, reward_id: reward_id)
reward_item.save
```

## TODO

* Deal with error cases: display error result instead of nil
* Refactor `Hashie::Dash` out into module for models
