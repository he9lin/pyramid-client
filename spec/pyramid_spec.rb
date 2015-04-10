require 'spec_helper'

describe Pyramid do
  let(:app_key)    { '88480333' }
  let(:app_secret) { '72fd96a2e4c9c2a9129f96a21bfb7012' }

  it 'initalize a client with application id and secret' do
    client = described_class::Client.new app_key, app_secret
    expect(client).to_not be_nil
  end

  it 'calls add points api' do
    client = described_class::Client.new app_key, app_secret

    VCR.use_cassette 'app_points' do
      response_json = client.api '/api/entities/yell-1/add_points', '{ "amount": 100 }'
      entity_json = response_json['entity']
      expect(entity_json).to have_key('id')
      expect(entity_json).to have_key('points')
      expect(entity_json['uname']).to eq('yell-1')
    end
  end
end
