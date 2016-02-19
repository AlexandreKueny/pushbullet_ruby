require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Contact < Entity
    def self.from_response(response)
      response.body['contacts'].map do |attributes|
        next unless attributes['active']
        new(attributes)
      end
    end

    def name
      body['name']
    end

    def email
      body['email']
    end
  end
end