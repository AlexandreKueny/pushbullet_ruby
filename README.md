# PushbulletRuby
[![Gem Version](https://badge.fury.io/rb/pushbullet_ruby.svg)](https://badge.fury.io/rb/pushbullet_ruby)
## Installation
Add this line to your application's Gemfile:
```ruby
gem 'pushbullet_ruby'
```
## Usage
### Setup
Puts your api-key into a token.json file formatted like this:
```ruby
{"token": "your api-key here"}
```
And setup your client:
```ruby
client = PushbulletRuby::Client.new(PushbulletRuby::Token.load)
```
### List devices
```ruby
client.devices
```
### Update device informations
```ruby
client.update_device(
    device_id: 'device id',
    params: {
        nickname: 'device name'
    }
)
```
### List contacts
```ruby
client.contacts
```
### List chats
```ruby
client.chats
```
### Create chat
```ruby
client.create_chat(
    params: {
        email: 'target email'
    }
)
```
### List subscriptions(channels)
```ruby
client.subscriptions
```
### Get recent channel pushes
```ruby
client.recent_pushes('channel tag')
```
### List pushes
```ruby
client.pushes
```
### Push
You can send following list:

- note
- link
- file
```ruby
client.push_note(
    receiver: :device,
    id: 'target id',
    params: {
        title: 'Title',
        body: 'Content'
    }
)
```
### Sms
```ruby
client.sens_sms(
    user_id: 'user id',
    device_id: 'device id',
    params: {
        conversation_iden: 'target phone number',
        message: 'Content'
    }
)
```
## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/creends/pushbullet_ruby.
##### This gem is inspired by [washbullet](https://github.com/hrysd/washbullet)



