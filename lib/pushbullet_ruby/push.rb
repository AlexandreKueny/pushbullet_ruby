require 'pushbullet_ruby/entity'
require 'pushbullet_ruby/api/pushes'

module PushbulletRuby
  class Push < Entity
    def self.from_response(response)
      response.body['pushes'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
      end
    end

    def update(client: nil, params: {})
      client.update_push(push_id: self.id, params: params)
    end

    def id
      body['iden']
    end

    def type
      body['type']
    end
  end
end
