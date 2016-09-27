module MRM
  class Api
    def initialize(url, login, pass)
      @url, @login, @pass = url, login, pass
    end

    def version_check
      uri = URI("#{url}/v2/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth(login, pass)
      response = http.request(request)

      if response.code == '200'
        JSON.parse(response.body)
      else
        raise ResponseError, response.body
      end
    end

    private
    attr_reader :url, :login, :pass
  end
end
