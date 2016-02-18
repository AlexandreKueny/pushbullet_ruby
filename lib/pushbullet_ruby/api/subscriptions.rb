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
        pushes = []
        channel_info(tag).body['recent_pushes'].each do |push|
          pushes << PushbulletRuby::Push.new(push)
        end
        pushes
      end
    end
  end
end