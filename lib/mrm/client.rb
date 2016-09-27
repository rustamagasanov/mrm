module MRM
  class Client
    def initialize
      @config = YAML.load_file('config.yml')
    end

    def version_check
      api.version_check
    end

    def list_repositories
      api.list_repositories
    end

    private
    attr_reader :config

    def api
      @api ||= Api.new(
        config['REGISTRY_URL'],
        config['REGISTRY_LOGIN'],
        config['REGISTRY_PASS']
      )
    end
  end
end
