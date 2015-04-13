require 'spec_helper'

describe Pyramid::Entity do
  let(:entity_id) { 1 } # fixture

  describe 'find entity(ies)' do
    it 'find entities given ids' do
      VCR.use_cassette 'entities/find_all' do
        entities = described_class.findAll(unames: ['yell-1'])
        expect(entities.map(&:uname)).to match_array(['yell-1'])
      end
    end

    it 'find entity by id' do
      VCR.use_cassette 'entities/show' do
        entity = described_class.find(entity_id)
        expect(entity.uname).to eq('yell-1')
      end
    end
  end

  describe 'add points to entity' do
    it 'adds points to entity' do
      VCR.use_cassette 'app_points' do
        entity = described_class.new(uname: 'yell-1')
        entity.add_points(100)
        expect(entity.points).to_not be_nil
      end
    end
  end
end
