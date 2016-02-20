module PushbulletRuby
  module API
    module Devices
      def devices
        PushbulletRuby::Device.from_responce(get('/v2/devices'))
      end

      def update_device(device_id: nil, params: {})
        PushbulletRuby::Device.new(post("/v2/devices/#{device_id}", params).body)
      end
    end
  end
end