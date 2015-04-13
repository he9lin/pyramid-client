module Pyramid
  module JSONResponse
    def self.call(resp)
      JSON.parse(resp.body)
    rescue JSON::ParserError => e
      nil
    end
  end
end
