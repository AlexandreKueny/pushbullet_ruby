module PushbulletRuby
  module Request
    def get(path, parms = {})
      request(:get, path, parms)
    end

    def post(path, payload)
      request(:post, path, payload)
    end

    def delete(path)
      request(:delete, path)
    end

    def request(method, path, params = {})
      connection.send(method) do |request|
        request.url path
        request.params = params if method == :get
        request.body = params if method == :post
      end
    end
  end
end