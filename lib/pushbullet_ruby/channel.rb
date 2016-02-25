require 'pushbullet_ruby/api/subscriptions'

module PushbulletRuby
  class Channel
    attr_reader :body
    def self.from_response(response)
      response.body['subscriptions'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes['channel'])
      end
    end

    def update(client: nil, params: {})
      client.update_subscription(channel_id: self.id, params: params)
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