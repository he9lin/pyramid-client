require 'spec_helper'

describe Pyramid::ActionEvent do
  it 'creates an action event' do
    entity_id = 1
    entity_action_id = 2

    VCR.use_cassette 'action_event/create' do
      event = described_class.new entity_name: 'yell-1', action_name: "checkin"
      event.save
      expect(event).to be_persisted
    end
  end
end
