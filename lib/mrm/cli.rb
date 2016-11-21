module MRM
  class CLI
    def initialize
      @config = YAML.load_file("#{Dir.home}/.mrmconfig")
    end

    def version_check
      puts api.version_check.brown
    end

    def get_manifest(name, reference)
      pp api.get_manifest(name, reference)
    end

    def list_repositories
      api.list_repositories['repositories'].each do |repo|
        puts repo.brown
      end
    end

    def list_tags(name)
      api.list_tags(name)['tags'].each do |tag|
        puts tag.brown
      end
    end

    def delete_image(name, reference)
      puts api.delete_image(name, reference)
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
