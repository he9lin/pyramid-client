module Pyramid
  module ApiRepo
    extend self

    def prefix
      '/api'
    end

    def rest_path(key)
      [prefix, key.pluralize].join('/')
    end

    def create(key, params)
      resq = Pyramid.client.api rest_path(key), {key => params}, method: :post
      resq[key]
    end

    def update
      # TODO:
    end
  end
end
