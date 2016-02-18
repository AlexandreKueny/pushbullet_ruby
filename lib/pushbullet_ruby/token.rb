module PushbulletRuby
  class Token

    def self.load(filename = 'token.json')
      begin
        File.open(File.expand_path(filename), 'r') do |f|
          JSON.parse(f.read)['token']
        end
      rescue => error
        puts error
      end
    end
  end
end