require 'spec_helper'

describe Pyramid do
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
end
