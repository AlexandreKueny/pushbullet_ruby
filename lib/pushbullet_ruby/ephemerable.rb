require 'pushbullet_ruby/ephemeral'

module PushbulletRuby
  class Ephemerable
    class MissingParameter < StandardError; end

    attr_reader :client, :user_identifier, :device_identifier, :params

    def self.push(client, user_identifier, device_identifier, params)
      Ephemeral.new(new(client, user_identifier, device_identifier, params).push.body)
    end

    def initialize(client, user_identifier, device_identifier, params)
      @client = client
      @user_identifier = user_identifier
      @device_identifier = device_identifier
      @params = params
    end

    def push
      raise MissingParameter unless required_parameters.all? { |e| params.keys.include?(e) }

      payload = {
          type: type,
          push: params.merge(construct_payload(user_identifier, device_identifier))
      }
      client.post('/v2/ephemerals', payload.to_json)
    end
  end
end