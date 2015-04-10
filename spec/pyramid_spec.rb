require 'spec_helper'

describe Pyramid do
  let(:app_key)    { 'ABCD1234' }
  let(:app_secret) { '20748624c55eaaac4453072ca3d9bc74' }

  it 'initalize a client with application id and secret' do
    client = described_class::Client.new app_key, app_secret
    expect(client).to_not be_nil
  end
end
