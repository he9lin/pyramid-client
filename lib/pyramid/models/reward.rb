module Pyramid
  class Reward < Hashie::Dash
    include Model

    property :id
    property :name
    property :description
    property :cost
    property :image_url
  end
end
