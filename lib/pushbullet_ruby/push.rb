require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Push < Entity
    def id
      body['iden']
    end

    def type
      body['type']
    end
  end
end