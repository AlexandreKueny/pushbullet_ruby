require 'pushbullet_ruby/api/me'
require 'pushbullet_ruby/api/devices'
require 'pushbullet_ruby/api/pushes'
require 'pushbullet_ruby/api/contacts'
require 'pushbullet_ruby/api/subscriptions'

module PushbulletRuby
  module API
    include Me
    include Devices
    include Pushes
    include Contacts
    include Subscriptions
  end
end