require 'ostruct'
require 'faraday'
require 'json'
require 'hashie/dash'
require 'faraday_middleware'
require 'ey-hmac/faraday'

require 'pyramid/version'
require 'pyramid/ext'
require 'pyramid/client'
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
