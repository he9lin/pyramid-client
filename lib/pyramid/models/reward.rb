module Pyramid
  class Reward < Hashie::Dash
    include Model

    property :id
    property :name
    property :description
    property :cost
  end
end
