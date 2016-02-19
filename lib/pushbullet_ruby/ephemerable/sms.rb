module PushbulletRuby
  class Ephemerable
    class Sms < Ephemerable
      def type
        :push
      end

      def required_parameters
        [:conversation_iden, :message]
      end

      def construct_payload(user_identifier, device_identifier)
        {
            source_user_iden: user_identifier,
            target_device_iden: device_identifier,
            package_name: 'com.pushbullet.android',
            type: 'messaging_extension_reply'
        }
      end
    end
  end
end