module Pyramid
  module Request
    def self.call(conn, url, body)
      conn.post do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept']       = 'application/vnd.heyook.v1'
        req.body = body
      end
    end
  end
end
