module PushbulletRuby
  class Pushable
    class Note < Pushable
      def type
        :note
      end

      def required_parameters
        [:title, :body]
      end
    end
  end
end