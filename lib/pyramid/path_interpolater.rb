module Pyramid
  module PathInterpolater
    REGEXP = /:\w+/

    def self.call(path, params)
      return nil unless path
      matches = path.scan REGEXP
      matches.each do |m|
        m = m[1..-1].to_sym
        path = path.sub(REGEXP, params[m].to_s)
      end
      path
    end

    def self.new(path)
      method(:call).curry[path]
    end
  end
end
