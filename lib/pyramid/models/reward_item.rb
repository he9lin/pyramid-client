module Pyramid
  class RewardItem < Hashie::Dash
    include Model

    path_prefix 'entities/:entity_id'

    property :id
    property :entity_id
    property :reward_id
    property :redeemed_at
    property :expired_at
  end
end
