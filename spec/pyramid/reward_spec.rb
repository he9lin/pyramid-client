require 'spec_helper'

describe Pyramid::Reward do
  context 'RESTful' do
    it 'create without cost' do
      VCR.use_cassette 'reward/create' do
        reward = described_class.new name: 'Macys Coupon', description: '50% off'
        reward.save
        expect(reward).to be_persisted
      end
    end

    it 'create cost' do
      VCR.use_cassette 'reward/create2' do
        reward = described_class.new name: 'Apple Coupon', description: '20% off', cost: 100
        reward.save
        expect(reward).to be_persisted
        expect(reward.cost).to eq(100)
      end
    end

    it 'show' do
      VCR.use_cassette 'reward/show' do
        reward_id = 2 # fixture id
        reward = described_class.find reward_id
        expect(reward).to be_persisted
        expect(reward.name).to eq('Apple Coupon')
        expect(reward.cost).to eq(100)
      end
    end
  end
end
