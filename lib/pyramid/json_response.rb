module Pyramid
  module JSONResponse
    def self.call(resp)
      JSON.parse(resp.body)
    end
  end
end
