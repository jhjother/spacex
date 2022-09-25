require 'resolv-replace'

module Spacex
  module Authenticate
    extend ActiveSupport::Concern

    base_uri = ENV['SPACEX_BASE_URI']
    space_key = ENV['SPACEX_KEY']

    included do
      include HTTParty

      headers 'Accept' => 'application/json', 'Content-Type' => 'application/json'
      base_uri base_uri
      basic_auth space_key, nil
    end
  end
end
