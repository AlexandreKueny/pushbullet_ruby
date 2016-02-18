module PushbulletRuby
  class Pushable
    class Link < Pushable
      def type
        :link
      end

      def required_parameters
        [:title, :url, :body]
      end
    end
  end
end