module Pyramid
  class EntityAction < Hashie::Dash
    include Model

    property :id
    property :name
    property :value
  end
end
