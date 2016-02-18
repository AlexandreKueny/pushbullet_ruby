require 'pushbullet_ruby/entity'

module PushbulletRuby
  class Contact < Entity
    def self.from_response(response)
      response.body['contacts'].each_with_object([]) do |attributes, memo|
        next unless attributes['active']
        memo << new(attributes)
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