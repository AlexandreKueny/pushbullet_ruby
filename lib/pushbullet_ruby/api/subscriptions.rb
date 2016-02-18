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
    end
  end
end