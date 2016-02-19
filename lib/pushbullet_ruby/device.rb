require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Device < Entity
    def self.from_responce(response)
      response.body['devices'].map do |attributes|
        next unless attributes['active']
        new(attributes)
      end
    end

    def id
      body['iden']
    end

    def name
      body['nickname']
    end
  end
end