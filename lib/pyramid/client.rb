require 'pyramid/connection'
require 'pyramid/request'
require 'pyramid/json_response'

module Pyramid
  Client = Struct.new(:config) do
    def api(url, body)
      Connection.call('http://localhost:3000', config.app_key, config.app_secret)
        .pipe { |conn| Request.call(conn, url, body) }
        .pipe { |resp| JSONResponse.call(resp) }
    end
  end
end
