require 'ostruct'
require 'active_support/core_ext/hash/keys'
require 'active_support/inflector'
require 'active_support/concern'
require 'faraday'
require 'json'
require 'hashie/dash'
require 'faraday_middleware'
require 'ey-hmac/faraday'

require 'pyramid/version'
require 'pyramid/ext'
require 'pyramid/client'
require 'pyramid/model'
require 'pyramid/api_repo'
require 'pyramid/entity_action'

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
