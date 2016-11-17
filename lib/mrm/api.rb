module MRM
  class Api
    def initialize(url, login, pass)
      @url, @login, @pass = url, login, pass
    end

    def version_check
      response = request("#{url}/v2/")
      if response.code == '200'
        puts '--> Repository is reachable and accessible.'
      else
        raise ResponseError, response.body
      end
    end

    def list_repositories
      response = request("#{url}/v2/_catalog")
      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    def list_tags(name)
      response = request("#{url}/v2/#{name}/tags/list")
      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    private
    attr_reader :url, :login, :pass

    def request(url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth(login, pass)
      http.request(request)
    end
  end
end
