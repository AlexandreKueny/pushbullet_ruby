require 'pushbullet_ruby/ephemerable'
require 'pushbullet_ruby/ephemerable/sms'
require 'pushbullet_ruby/ephemerable/notifitation'

module PushbulletRuby
  module API
    module Ephemerals
      def send_sms(user_id: nil, device_id: nil, params: {})
        PushbulletRuby::Ephemerable::Sms.push(self, user_id, device_id, params)
      end

      def push_notification(user_id: nil, device_id: nil, params: {})
        PushbulletRuby::Ephemerable::Notification.push(self, user_id, device_id, params)
      end
    end
  end
end