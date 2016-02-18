require 'pushbullet_ruby/entity'

module PushbulletRuby
  class User < Entity
      def id
        body['iden']
      end
  end
end