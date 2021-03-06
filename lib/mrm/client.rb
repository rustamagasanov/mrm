module MRM
  class Client
    def initialize
      @config = YAML.load_file("#{Dir.home}/.mrmconfig")
    end

    def version_check
      api.version_check
    end

    def get_manifest(name, reference)
      api.get_manifest(name, reference)
    end

    def list_repositories
      api.list_repositories['repositories']
    end

    def list_tags(name)
      api.list_tags(name)['tags']
    end

    def delete_image(name, reference)
      api.delete_image(name, reference)
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
