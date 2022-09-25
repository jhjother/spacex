require 'rails_helper'

describe Spacex::Launches::LaunchesFetcher do
  describe '#call' do
    context 'when show next launch' do
      before(:each) { VCR.insert_cassette('launches/next') }
      after(:each) { VCR.eject_cassette }

      before do
        @result = described_class.new(
          action: :next
        ).call
      end

      let(:expect_result) do
        {
          'name' => 'Starlink 4-35 (v1.5)',
          'date_precision' => 'hour',
          'flight_number' => 186
        }
      end

      it { expect(@result.to_h).to include expect_result }
      it { expect(@result.request.path.to_s).to eq '/launches/next' }
    end

    context 'when show latest launch' do
      before(:each) { VCR.insert_cassette('launches/latest') }
      after(:each) { VCR.eject_cassette }

      before do
        @result = described_class.new(
          action: :latest
        ).call
      end

      let(:expect_result) do
        {
          'name' => 'Starlink 4-34 (v1.5)',
          'date_precision' => 'hour',
          'flight_number' => 185
        }
      end

      it { expect(@result.to_h).to include expect_result }
      it { expect(@result.request.path.to_s).to eq '/launches/latest' }
    end

    context 'when list upcoming launch' do
      before(:each) { VCR.insert_cassette('launches/upcoming') }
      after(:each) { VCR.eject_cassette }

      before do
        @result = described_class.new(
          action: :upcoming
        ).call
      end

      it { expect(@result.count).to eq 8 }
      it { expect(@result.request.path.to_s).to eq '/launches/upcoming' }
    end

    context 'when list past launches' do
      before(:each) { VCR.insert_cassette('launches/past') }
      after(:each) { VCR.eject_cassette }

      before do
        @result = described_class.new(
          action: :past
        ).call
      end

      it { expect(@result.count).to eq 185 }
      it { expect(@result.request.path.to_s).to eq '/launches/past' }
    end
  end
end
