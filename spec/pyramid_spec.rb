require 'spec_helper'

describe Pyramid do
  let(:app_key)    { '88480333' }
  let(:app_secret) { '72fd96a2e4c9c2a9129f96a21bfb7012' }

  it 'sets default config' do
    expect(described_class.config.app_key).to eq('88480333')
    expect(described_class.config.app_secret).to eq('72fd96a2e4c9c2a9129f96a21bfb7012')
  end

  it 'has a default client' do
    expect(described_class.client).to be_a(described_class::Client)
    expect(described_class.client.config).to eq(described_class.config)
  end

  it 'initalize a client with application id and secret' do
    config = OpenStruct.new app_key: '11111111', app_secret: '72fd96a2e4c9c2a9129f96a21bfb7012'
    client = described_class::Client.new config
    expect(client).to_not be_nil
  end

  it 'basic api call' do
    client = Pyramid.client

    VCR.use_cassette 'app_points' do
      response_json = client.api '/api/entities/yell-1/add_points', { amount: 100 }, method: :post
      entity_json = response_json['entity']
      expect(entity_json).to have_key('id')
      expect(entity_json).to have_key('points')
      expect(entity_json['uname']).to eq('yell-1')
    end
  end

  describe Pyramid::EntityAction do
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
          entity_action_id = 2 # fixture id
          action = described_class.find entity_action_id
          expect(action).to be_persisted
          expect(action.name).to eq('retweet')
        end
      end

      it 'update' do
        VCR.use_cassette 'entity_action/update' do
          entity_action_id = 2 # fixture id
          action = described_class.find entity_action_id
          action.name = 'retweet-2'
          action.save
          expect(action.name).to eq('retweet-2')
        end
      end

      it 'destroy' do
        VCR.use_cassette 'entity_action/destroy' do
          entity_action_id = 2 # fixture id
          action = described_class.find entity_action_id
          action.destroy
        end
      end
    end
  end
end
