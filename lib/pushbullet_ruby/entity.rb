module PushbulletRuby
  class Entity
    attr_reader :body

    def initialize(body)
      @body = body
    end

    def created
      Time.at(body['created'])
    end

    def modified
      Time.at(body['modified'])
    end
  end
end