require 'spec_helper'

describe Pyramid::PathInterpolater do
  it 'replace parts with corresponding value' do
    result = described_class.('entities/:entity_id', {entity_id: '1'})
    expect(result).to eq('entities/1')

    result = described_class.('entities/:entity_id/items/:item_id', {entity_id: '1', item_id: '2'})
    expect(result).to eq('entities/1/items/2')
  end

  it 'some curry fun' do
    m = described_class.new('entities/:entity_id')
    result = m.(entity_id: '1')
    expect(result).to eq('entities/1')
  end

  it 'returns nil if path is nil' do
    m = described_class.new(nil)
    result = m.(entity_id: '1')
    expect(result).to be_nil
  end
end
