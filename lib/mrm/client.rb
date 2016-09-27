module MRM
  class Client
    attr_reader :api

    def initialize
      @api = Api.new
    end
  end
end
