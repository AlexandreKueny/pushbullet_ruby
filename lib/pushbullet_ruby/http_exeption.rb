module PushbulletRuby
  class BadRequest    < StandardError; end
  class Unauthorized  < StandardError; end
  class RequestFailed < StandardError; end
  class Forbidden     < StandardError; end
  class NotFound      < StandardError; end
  class ServerError   < StandardError; end

  class HttpException < Faraday::Response::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        exception =
            case response.status
              when 400      then PushbulletRuby::BadRequest
              when 401      then PushbulletRuby::Unauthorized
              when 402      then PushbulletRuby::RequestFailed
              when 403      then PushbulletRuby::Forbidden
              when 404      then PushbulletRuby::NotFound
              when 500..505 then PushbulletRuby::ServerError
            end

        raise exception, error_message(response.body) if exception
      end
    end

    private

    def error_message(response_body)
      hash = JSON.parse(response_body)['error']

      [hash['message'], hash['cat']].join(' ')
    end
  end
end
