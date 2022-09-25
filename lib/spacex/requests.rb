module Spacex
  class Requests

    include Spacex::Authenticate

    def initialize(url, params = {})
      @url = url
      @params = params
    end

    def get
      Spacex::Requests.get(url)
    end

    private

    attr_reader :url, :params
  end
end
