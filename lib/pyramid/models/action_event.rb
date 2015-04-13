module Pyramid
  class ActionEvent < Hashie::Dash
    include Model

    path_prefix 'entities/:entity_name'

    property :id
    property :entity_id
    property :entity_name
    property :entity_action_id
    property :action_name
  end
end
