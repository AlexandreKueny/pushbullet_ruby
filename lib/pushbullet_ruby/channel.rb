require 'pushbullet_ruby/api'

module PushbulletRuby
  class Channel
    attr_reader :body

    def self.from_response(response)
      response.body['subscriptions'].map do |attributes|
        next unless attributes['active']
        new(attributes['channel'])
      end
    end

    def initialize(response)
      @body = response
    end

    def tag
      body['tag']
    end

    def name
      body['name']
    end

    def id
      body['iden']
    end
  end
end