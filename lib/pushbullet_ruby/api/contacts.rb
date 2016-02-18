module PushbulletRuby
  module API
    module Contacts
      def contacts
        PushbulletRuby::Contact.from_response(get('/v2/contacts'))
      end
    end
  end
end