module Pyramid
  class Entity < Hashie::Dash
    include Model

    property :id
    property :uname
    property :points

    def add_points(amount)
      api_repo.custom('add_points', to_param, {amount: amount})
        .map { |h| update_attributes! h }
    end

    def to_param
      uname
    end
  end
end
