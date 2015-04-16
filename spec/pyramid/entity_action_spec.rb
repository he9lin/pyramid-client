require 'spec_helper'

describe Pyramid::EntityAction do
  let(:entity_action_id) { 4 }

  context 'RESTful' do
    it 'create' do
      VCR.use_cassette 'entity_action/create' do
        action = described_class.new name: 'retweet', value: 100
        action.save
        expect(action).to be_persisted
      end
    end

    it 'show' do
      VCR.use_cassette 'entity_action/show' do
        action = described_class.find entity_action_id
        expect(action).to be_persisted
        expect(action.name).to eq('retweet')
      end
    end

    it 'update' do
      VCR.use_cassette 'entity_action/update' do
        action = described_class.find entity_action_id
        action.name = 'retweet-2'
        action.save
        expect(action.name).to eq('retweet-2')
      end
    end

    it 'destroy' do
      VCR.use_cassette 'entity_action/destroy' do
        action = described_class.find entity_action_id
        action.destroy
      end
    end
  end
end
