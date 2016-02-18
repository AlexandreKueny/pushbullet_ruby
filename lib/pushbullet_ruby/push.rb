require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Push < Entity
    def self.from_response(response)
      response.body['pushes'].each_with_object([]) do |push, memo|
        next unless push['active']
        memo << new(push)
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