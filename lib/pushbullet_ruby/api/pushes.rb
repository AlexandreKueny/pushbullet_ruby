require 'pushbullet_ruby/pushable'
require 'pushbullet_ruby/pushable/note'
require 'pushbullet_ruby/pushable/link'
require 'pushbullet_ruby/pushable/file'

module PushbulletRuby
  module API
    module Pushes
      def push_note(receiver: nil, id: nil, params: {})
        PushbulletRuby::Pushable::Note.push(self, receiver, id, params)
      end

      def push_link(receiver: nil, id: nil, params: {})
        PushbulletRuby::Pushable::Link.push(self, receiver, id, params)
      end

      def push_file(receiver: nil, id: nil, params: {})
        PushbulletRuby::Pushable::File.push(self, receiver, id, params)
      end

      def pushes
        PushbulletRuby::Push.from_response(get('/v2/pushes'))
      end

      def update_push(push_id: nil, params: {})
        PushbulletRuby::Push.new(post("/v2/pushes/#{push_id}", params).body)
      end

      def delete_push(push_id: nil)
        delete("/v2/pushes/#{push_id}").body
      end

      def delete_all_pushes
        delete('/v2/pushes').body
      end
    end
  end
end