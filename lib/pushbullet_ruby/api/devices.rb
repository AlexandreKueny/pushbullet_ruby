module PushbulletRuby
  module API
    module Devices
      def devices
        PushbulletRuby::Device.from_responce(get('/v2/devices'))
      end

      def update_device(device_id: nil, params: {})
        PushbulletRuby::Device.new(post("/v2/devices/#{device_id}", params).body)
      end

      def create_device(params: {})
        PushbulletRuby::Device.new(post('/v2/devices', params).body)
      end

      def delete_device(device_id: nil)
        delete("/v2/devices/#{device_id}").body
      end
    end
  end
end