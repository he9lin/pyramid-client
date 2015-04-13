require 'spec_helper'

describe Pyramid::RewardItem do
  it 'successfully creates one (given enough points)' do
    entity_id = 1
    reward_id = 2

    VCR.use_cassette 'reward_item/create' do
      item = described_class.new entity_id: entity_id, reward_id: reward_id
      item.save
    end
  end
end
