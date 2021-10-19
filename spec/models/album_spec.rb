require 'rails_helper'

RSpec.describe Album, type: :model do
  let(:album) { create(:album) }

  context 'Simple validations for Album model' do
    it { should validate_presence_of(:artist_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:year) }

    it "Albums can't be released in the future" do
      date_in_future = (Date.today.year + 1)
      album.year = date_in_future
      expect(album).to_not be_valid
    end
  end
end
