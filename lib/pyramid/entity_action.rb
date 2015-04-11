module Pyramid
  class EntityAction < Hashie::Dash
    property :id
    property :name
    property :value

    def save
      params = {entity_action: to_hash}
      Pyramid.client.api '/api/entity_actions', params
    end
  end
end
