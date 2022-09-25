module Api
  module V1
    class LaunchesController < ApplicationController
      def next
        launch = Spacex::Launches::LaunchesFetcher.new(
          action: :next
        ).call

        render json: launch
      end

      def latest
        launch = Spacex::Launches::LaunchesFetcher.new(
          action: :latest
        ).call

        render json: launch
      end

      def upcoming
        launches = Spacex::Launches::LaunchesFetcher.new(
          action: :upcoming
        ).call

        render json: launches.to_a
      end

      def past
        launches = Spacex::Launches::LaunchesFetcher.new(
          action: :past
        ).call

        render json: launches.to_a
      end
    end
  end
end
