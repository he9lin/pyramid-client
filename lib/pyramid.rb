require 'ostruct'
require 'active_support/core_ext/hash/keys'
require 'active_support/inflector'
require 'active_support/concern'
require 'active_support/core_ext/array/wrap'
require 'faraday'
require 'json'
require 'hashie/dash'
require 'faraday_middleware'
require 'ey-hmac/faraday'

require 'pyramid/version'
require 'pyramid/core_ext/pipe'
require 'pyramid/path_interpolater'
require 'pyramid/serializer'
require 'pyramid/client'
require 'pyramid/api_repo'

require 'pyramid/model'
require 'pyramid/models/entity'
require 'pyramid/models/entity_action'
require 'pyramid/models/reward'
require 'pyramid/models/reward_item'
require 'pyramid/models/action_event'

module Pyramid
  class << self
    def configure(&block)
      block.call(config)
      config
    end

    def config
      @_config ||= OpenStruct.new
    end

    def client
      @_client ||= Client.new config
    end
  end
end
