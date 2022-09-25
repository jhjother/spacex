module Spacex
  module Launches
    class LaunchesFetcher
      def initialize(action:)
        @action = action
      end

      def call
        launches
        response
      end

      private

      attr_reader :action, :response

      def launches
        @response = Spacex::Requests.new("/launches/#{action}").get
      end
    end
  end
end
