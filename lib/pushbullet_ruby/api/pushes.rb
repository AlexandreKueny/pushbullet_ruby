require 'pushbullet_ruby/pushable'
require 'pushbullet_ruby/pushable/note'
require 'pushbullet_ruby/pushable/link'
require 'pushbullet_ruby/pushable/file'

module PushbulletRuby
  module API
    module Pushes
      def push_note(receiver: nil, identifier: nil, params: {})
        PushbulletRuby::Pushable::Note.push(self, receiver, identifier, params)
      end

      def push_link(receiver: nil, identifier: nil, params: {})
        PushbulletRuby::Pushable::Link.push(self, receiver, identifier, params)
      end

      def push_file(receiver: nil, identifier: nil, params: {})
        PushbulletRuby::Pushable::File.push(self, receiver, identifier, params)
      end
    end
  end
end