require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Push < Entity
    def self.from_response(response)
      response.body['pushes'].map do |attributes|
        next unless attributes['active']
        new(attributes)
      end
    end

    def id
      body['iden']
    end

    def type
      body['type']
    end
  end
end