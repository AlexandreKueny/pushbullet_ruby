module PushbulletRuby
  module API
    module Chats
      def chats
        PushbulletRuby::Chat.from_response(get('/v2/chats'))
      end

      def create_chat(params: {})
        PushbulletRuby::Chat.new(post('/v2/chats', params).body)
      end

      def delete_chat(chat_id: nil)
        delete("/v2/chats/#{chat_id}").body
      end

      def update_chat(chat_id: nil, params: {})
        PushbulletRuby::Chat.new(post("/v2/chats/#{chat_id}", params).body)
      end
    end
  end
end