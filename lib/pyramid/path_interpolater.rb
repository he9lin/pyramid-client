module Pyramid
  class PathInterpolater
    REGEXP = /:\w+/

    def self.call(path, params)
      new(path).call(params)
    end

    def call(params)
      return nil unless path
      matches = path.scan REGEXP
      result  = path.dup
      matches.each do |m|
        m = m[1..-1].to_sym
        result = result.sub(REGEXP, params[m].to_s)
      end
      result
    end

    def initialize(path)
      @path = path
    end

    private

    attr_accessor :path
  end
end
