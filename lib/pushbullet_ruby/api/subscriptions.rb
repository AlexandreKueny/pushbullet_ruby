require 'pushbullet_ruby/push'

module PushbulletRuby
  module API
    module Subscriptions
      def subscriptions
        PushbulletRuby::Channel.from_response(get('/v2/subscriptions'))
      end

      def channel_info(tag)
        PushbulletRuby::Channel.new(get('/v2/channel-info', tag: tag).body)
      end

      def recent_pushes(tag)
        channel_info(tag).body['recent_pushes'].each_with_object([]) do |push, memo|
          memo << PushbulletRuby::Push.new(push)
        end
      end

      def update_subscription(channel_id: nil, params: {})
        PushbulletRuby::Channel.new(post("/v2/subscriptions/#{channel_id}", params).body)
      end

      def delete_subscription(channel_id: nil)
        delete("/v2/subscriptions/#{channel_id}").body
      end

      def create_subscription(params: {})
        PushbulletRuby::Channel.new(post('/v2/subscriptions', params))
      end
    end
  end
end