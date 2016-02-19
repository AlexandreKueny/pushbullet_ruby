module PushbulletRuby
  class Ephemerable
    class Notification < Ephemerable
      def type
        :push
      end

      def required_parameters
        [:title, :body]
      end

      def construct_payload(user_identifier, device_identifier)
        {
            source_user_iden: user_identifier,
            source_device_iden: device_identifier,
            package_name: 'com.pushbullet.android',
            type: 'mirror'
        }
      end
    end
  end
end