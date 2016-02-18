module PushbulletRuby
  class Authorization < Faraday::Request::Authorization
    def call(env)
      if env.url.to_s.match(PushbulletRuby::Client::URL)
        env.request_headers[KEY] = @header_value
      end
      @app.call env
    end
  end
end