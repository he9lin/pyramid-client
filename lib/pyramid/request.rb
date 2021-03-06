module Pyramid
  class Request
    def self.call(conn, url, body, method)
      conn.send method do |req|
        req.url url
        req.headers['Content-Type'] = 'application/json'
        req.headers['Accept']       = 'application/vnd.heyook.v1'
        req.body = body
      end
    rescue Faraday::Error::ConnectionFailed => e
      # TODO: properly handle error
      nil
    end
  end
end
