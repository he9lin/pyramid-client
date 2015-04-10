require 'ostruct'
require 'faraday'
require 'json'
require 'ey-hmac/faraday'

require 'pyramid/version'
require 'pyramid/ext'
require 'pyramid/client'

module Pyramid
  class << self
    attr_accessor :url
  end
end
