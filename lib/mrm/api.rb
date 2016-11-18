module MRM
  class Api
    def initialize(url, login, pass)
      @url, @login, @pass = url, login, pass
    end

    def version_check
      response = get_request("#{url}/v2/")
      if response.code == '200'
        '--> Repository is reachable and accessible.'
      else
        raise ResponseError, response.body
      end
    end

    def get_manifest(name, reference)
      response = get_request(
        "#{url}/v2/#{name}/manifests/#{reference}",
        { 'Accept' => 'application/vnd.docker.distribution.manifest.v2+json' }
      )
      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    def list_repositories
      response = get_request("#{url}/v2/_catalog")
      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    def list_tags(name)
      response = get_request("#{url}/v2/#{name}/tags/list")
      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    def delete_image(name, reference)
      response = delete_request("#{url}/v2/#{name}/manifests/#{reference}")
      if response.code == '202'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    private
    attr_reader :url, :login, :pass

    def get_request(url, headers = {})
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      request = Net::HTTP::Get.new(uri.request_uri)
      headers.each do |key, value|
        request[key] = value
      end
      request.basic_auth(login, pass)
      http.request(request)
    end

    def delete_request(url)
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      request = Net::HTTP::Delete.new(uri.request_uri)
      request.basic_auth(login, pass)
      http.request(request)
    end
  end
end
