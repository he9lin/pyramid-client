module Pyramid
  class Serializer
    def initialize(key)
      @key = key
    end

    def call(params)
      Array.wrap(params[key]).map(&:symbolize_keys)
    end

    private

    attr_reader :key
  end
end
