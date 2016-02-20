require 'pushbullet_ruby/api/me'
require 'pushbullet_ruby/api/devices'
require 'pushbullet_ruby/api/pushes'
require 'pushbullet_ruby/api/ephemerals'
require 'pushbullet_ruby/api/contacts'
require 'pushbullet_ruby/api/subscriptions'
require 'pushbullet_ruby/api/chats'

module PushbulletRuby
  module API
    include Me
    include Devices
    include Pushes
    include Ephemerals
    include Contacts
    include Subscriptions
    include Chats
  end
end