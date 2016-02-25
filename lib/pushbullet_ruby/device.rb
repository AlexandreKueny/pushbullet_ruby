require 'pushbullet_ruby/entity'
require 'pushbullet_ruby/api/devices'

module PushbulletRuby
  class Device < Entity
    def self.from_responce(response)
      response.body['devices'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
      end
    end

    def update(client: nil, params: {})
      client.update_device(device_id: self.id, params: params)
    end

    def id
      body['iden']
    end

    def name
      body['nickname']
    end

    def app_version
      body['app_version']
    end
  end
end