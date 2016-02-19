require 'pushbullet_ruby/ephemerable'
require 'pushbullet_ruby/ephemerable/sms'
require 'pushbullet_ruby/ephemerable/notifitation'

module PushbulletRuby
  module API
    module Ephemerals
      def send_sms(user_identifier: nil, device_identifier: nil, params: {})
        PushbulletRuby::Ephemerable::Sms.push(self, user_identifier, device_identifier, params)
      end

      def push_notification(user_identifier: nil, device_identifier: nil, params: {})
        PushbulletRuby::Ephemerable::Notification.push(self, user_identifier, device_identifier, params)
      end
    end
  end
end