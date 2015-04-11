module Pyramid
  module Connection
    def self.call(api_root, app_key, app_secret)
      @_conn ||= Faraday.new(url: api_root) do |c|
        c.request :json
        c.use :hmac, app_key, app_secret
        c.adapter Faraday.default_adapter
      end
    end
  end
end
