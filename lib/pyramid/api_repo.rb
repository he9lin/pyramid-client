module Pyramid
  module ApiRepo
    extend self

    def api_prefix
      '/api'
    end

    def custom(custom_path, key, id, amount)
      path = [build_single_resource_path(key, id), custom_path].join('/')

      {amount: amount}
        .pipe(api_call(path, :post))
        .pipe(serializer(key))
        .first
    end

    def create(key, params)
      path = rest_path(key)

      params
        .pipe(adapter(key))
        .pipe(api_call(path, :post))
        .pipe(serializer(key))
    end

    def update(key, id, params)
      path = build_single_resource_path(key, id)

      params
        .pipe(adapter(key))
        .pipe(api_call(path, :put))
    end

    def find(key, id)
      path = build_single_resource_path(key, id)

      api(path)
        .pipe(serializer(key))
    end

    def findAll(key, opts={})
      path = rest_path(key)
      api(path, opts)
        .pipe(serializer(key.pluralize))
    end

    def destroy(key, id)
      path = build_single_resource_path(key, id)

      api(path, nil, method: :delete)
    end

    private

    def api(*args)
      Pyramid.client.api(*args)
    end

    def build_single_resource_path(key, id)
      [rest_path(key), id].join('/')
    end

    def serializer(key)
      -> (params) {
        Array.wrap(params[key]).map(&:symbolize_keys)
      }
    end

    def adapter(key)
      -> (params) { {key => params} }
    end

    def api_call(path, method)
      -> (params) { api(path, params, method: method) }
    end

    def rest_path(key)
      [api_prefix, key.pluralize].join('/')
    end
  end
end
