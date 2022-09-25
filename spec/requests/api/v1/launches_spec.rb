require 'rails_helper'

describe Api::V1::LaunchesController, type: :request do
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET /api/v1/launches/next' do
    context 'when show next launch' do
      before(:each) { VCR.insert_cassette('launches/next') }
      after(:each) { VCR.eject_cassette }

      before do
        get '/api/v1/launches/next'
      end

      let(:expect_response) do
        {
          'name' => 'Starlink 4-35 (v1.5)',
          'date_precision' => 'hour',
          'flight_number' => 186
        }
      end

      it { expect(response_body).to include expect_response }
      it { expect(response).to have_http_status :ok }
    end
  end

  describe 'GET /api/v1/launches/latest' do
    context 'when show latest launch' do
      before(:each) { VCR.insert_cassette('launches/latest') }
      after(:each) { VCR.eject_cassette }

      before do
        get '/api/v1/launches/latest'
      end

      let(:expect_response) do
        {
          'name' => 'Starlink 4-34 (v1.5)',
          'date_precision' => 'hour',
          'flight_number' => 185
        }
      end

      it { expect(response_body).to include expect_response }
      it { expect(response).to have_http_status :ok }
    end
  end

  describe 'GET /api/v1/launches/upcoming' do
    context 'when list upcoming launches' do
      before(:each) { VCR.insert_cassette('launches/upcoming') }
      after(:each) { VCR.eject_cassette }

      before do
        get '/api/v1/launches/upcoming'
      end

      let(:expect_response) do
        {
          'name' => 'Starlink 4-34 (v1.5)',
          'date_precision' => 'hour',
          'flight_number' => 185
        }
      end

      it { expect(response_body.count).to eq 8 }
      it { expect(response).to have_http_status :ok }
    end
  end

  describe 'GET /api/v1/launches/past' do
    context 'when list past launches' do
      before(:each) { VCR.insert_cassette('launches/past') }
      after(:each) { VCR.eject_cassette }

      before do
        get '/api/v1/launches/past'
      end

      it { expect(response_body.count).to eq 185 }
      it { expect(response).to have_http_status :ok }
    end
  end
end
