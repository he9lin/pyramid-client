require 'pyramid/connection'
require 'pyramid/request'
require 'pyramid/json_response'

module Pyramid
  Client = Struct.new(:config) do
    def api(url, body, opts={})
      method = opts.fetch(:method, :get)
      Connection.call(config.api_root, config.app_key, config.app_secret)
        .pipe { |conn| Request.call(conn, url, body, method) }
        .pipe { |resp| JSONResponse.call(resp) }
    end
  end
end
