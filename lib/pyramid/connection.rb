module Pyramid
  module Connection
    def self.call(api_root, app_key, app_secret)
      @_conn ||= Faraday.new(url: api_root) do |c|
        c.request :json
        c.token_auth [app_key, app_secret].join('.')
        c.adapter Faraday.default_adapter
      end
    end
  end
end
