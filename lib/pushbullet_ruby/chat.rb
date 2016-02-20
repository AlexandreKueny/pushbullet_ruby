require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Chat < Entity
    def self.from_response(response)
      response.body['chats'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
      end
    end

    def id
      body['iden']
    end
  end
end