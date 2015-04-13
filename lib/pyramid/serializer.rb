module Pyramid
  module Serializer
    def self.call(key, params)
      Array.wrap(params[key]).map(&:symbolize_keys)
    end

    def self.new(key)
      method(:call).curry[key]
    end
  end
end
