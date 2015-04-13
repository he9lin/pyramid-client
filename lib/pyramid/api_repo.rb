module Pyramid
  class ApiRepo
    DEFAULT_OPTS = {
      api_prefix: '/api'
    }

    attr_reader :key, :opts, :serializer, :adapter, :rest_path_builder

    def initialize(key, opts={})
      @key  = key
      @opts = opts.merge DEFAULT_OPTS
      @serializer = Serializer.new(key)
      @adapter = -> (params) { {key => params} }
      path_interpolater = PathInterpolater.new(path_prefix)
      @rest_path_builder = -> (params) {
        [
          api_prefix,
          path_interpolater.(params),
          key.pluralize
        ].compact.join('/')
      }
    end

    def api_prefix
      opts[:api_prefix]
    end

    def path_prefix
      opts[:path_prefix]
    end

    def custom(custom_path, id, params)
      path = [single_resource_path(id), custom_path].join('/')

      params
        .pipe(api_call(path, :post))
        .pipe(serializer)
    end

    def create(params)
      path = rest_path(params)

      params
        .pipe(adapter)
        .pipe(api_call(path, :post))
        .pipe(serializer)
    end

    def update(id, params)
      path = single_resource_path(id, params)

      params
        .pipe(adapter)
        .pipe(api_call(path, :put))
    end

    def find(id, params={})
      path = single_resource_path(id, params)

      api(path)
        .pipe(serializer)
    end

    def findAll(params={})
      serializer = Serializer.new(key.pluralize)

      api(rest_path, params)
        .pipe(serializer)
    end

    def destroy(id)
      path = single_resource_path(id)

      api(path, nil, method: :delete)
    end

    private

    def api(*args)
      Pyramid.client.api(*args)
    end

    def api_call(path, method)
      -> (params) { api(path, params, method: method) }
    end

    def single_resource_path(id, params={})
      [rest_path(params), id].join('/')
    end

    def rest_path(params={})
      rest_path_builder.(params)
    end
  end
end
