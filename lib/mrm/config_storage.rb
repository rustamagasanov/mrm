module MRM
  class ConfigStorage
    def initialize(url, login, password)
      @url, @login, @password = url, login, password
    end

    def store!
      f = File.new("#{Dir.home}/.mrmconfig", 'w')
      f.puts("REGISTRY_URL: #{url}")
      f.puts("REGISTRY_LOGIN: #{login}")
      f.puts("REGISTRY_PASS: #{password}")
      f.close
    end

    private
    attr_reader :url, :login, :password
  end
end
