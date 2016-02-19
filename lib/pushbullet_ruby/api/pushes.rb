require 'pushbullet_ruby/pushable'
require 'pushbullet_ruby/pushable/note'
require 'pushbullet_ruby/pushable/link'
require 'pushbullet_ruby/pushable/file'

module PushbulletRuby
  module API
    module Pushes
      def push_note(receiver: nil, device_identifier: nil, params: {})
        PushbulletRuby::Pushable::Note.push(self, receiver, device_identifier, params)
      end

      def push_link(receiver: nil, device_identifier: nil, params: {})
        PushbulletRuby::Pushable::Link.push(self, receiver, device_identifier, params)
      end

      def push_file(receiver: nil, device_identifier: nil, params: {})
        PushbulletRuby::Pushable::File.push(self, receiver, device_identifier, params)
      end

      def pushes
        PushbulletRuby::Push.from_response(get('/v2/pushes'))
      end
    end
  end
end