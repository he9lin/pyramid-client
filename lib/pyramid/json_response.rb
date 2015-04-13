module Pyramid
  module JSONResponse
    def self.call(resp)
      # TODO: handle error
      return nil unless resp

      JSON.parse(resp.body)
    rescue JSON::ParserError => e
      nil
    end
  end
end
