module Pyramid
  class Entity < Hashie::Dash
    include Model

    property :id
    property :uname
    property :points

    def add_points(amount)
      attrs = ApiRepo.custom('add_points', key, to_param, amount)
      update_attributes! attrs.symbolize_keys
    end

    def to_param
      uname
    end
  end
end
