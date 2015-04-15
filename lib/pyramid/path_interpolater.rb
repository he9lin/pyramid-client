module Pyramid
  class PathInterpolater
    REGEXP = /:\w+/

    def self.call(path, params)
      new(path).call(params)
    end

    def call(params)
      return nil unless path
      matches = path.scan REGEXP
      matches.each do |m|
        m = m[1..-1].to_sym
        self.path = path.sub(REGEXP, params[m].to_s)
      end
      path
    end

    def initialize(path)
      @path = path
    end

    private

    attr_accessor :path
  end
end
