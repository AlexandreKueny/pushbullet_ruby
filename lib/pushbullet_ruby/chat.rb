require 'pushbullet_ruby/entity'
require 'pushbullet_ruby/api/chats'

module PushbulletRuby
  class Chat < Entity
    def self.from_response(response)
      response.body['chats'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
      end
    end

    def update(client: nil, params: {})
      client.update_chat(chat_id: self.id, params: params)
    end

    def id
      body['iden']
    end
  end
end