require 'pyramid/connection'
require 'pyramid/request'
require 'pyramid/json_response'

module Pyramid
  Client = Struct.new(:app_key, :app_secret) do
    def api(url, body)
      Connection.call('http://localhost:3000', app_key, app_secret)
        .pipe { |conn| Request.call(conn, url, body) }
        .pipe { |resp| JSONResponse.call(resp) }
    end
  end
end
