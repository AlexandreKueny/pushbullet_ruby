require 'faraday'
require 'mime/types'

require 'pushbullet_ruby/api'
require 'pushbullet_ruby/request'
require 'pushbullet_ruby/authorization'
require 'pushbullet_ruby/parse_json'
require 'pushbullet_ruby/http_exeption'

module PushbulletRuby
  class Client
    include Request
    include API

    attr_reader :key

    URL = 'https://api.pushbullet.com'

    def initialize(key)
      @key = key
    end

    def connection
      @connection ||= Faraday.new(URL, connection_options)
    end

    def connection_options
      @connection_options ||= {
          builder: middleware,
          headers: {
              accept: 'application/json',
              user_agent: 'Pushbullet Gem'
          },
          ssl: {
              verify: false
          }
      }
    end

    def middleware
      @middleware ||= Faraday::RackBuilder.new do |f|
        f.request :multipart
        f.request :url_encoded
        f.use PushbulletRuby::Authorization, 'Bearer', key
        f.use PushbulletRuby::ParseJSON
        f.use PushbulletRuby::HttpException
        f.adapter :net_http
      end
    end
  end
end