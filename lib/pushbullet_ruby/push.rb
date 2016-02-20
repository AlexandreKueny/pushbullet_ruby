require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Push < Entity
    def self.from_response(response)
      response.body['pushes'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
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