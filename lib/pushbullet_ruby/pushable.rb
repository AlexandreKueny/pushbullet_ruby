require 'pushbullet_ruby/push'

module PushbulletRuby
  class Pushable
    class MissingParameter < StandardError; end

    attr_reader :client, :receiver, :identifier, :params

    def self.push(client, receiver, identifier, params)
      Push.new(new(client, receiver, identifier, params).push.body)
    end

    def initialize(client, receiver, identifier, params)
      @client = client
      @receiver = receiver
      @identifier = identifier
      @params = params
    end

    def push
      raise MissingParameter unless params.keys.sort == required_parameters.sort

      payload = params.merge(type: type)
      payload = specify_receiver(payload)
      client.post('/v2/pushes', payload)
    end

    def specify_receiver(payload)
      if receiver && identifier
        payload.merge(receiver_type => identifier)
      else
        payload
      end
    end

    def receiver_type
      case receiver
        when :device then :device_iden
        when :email then receiver
        when :channel then :channel_tag
        when :client then :client_iden
        else
          raise NotImplementedError
      end
    end
  end
end