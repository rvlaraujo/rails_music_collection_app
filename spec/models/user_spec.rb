require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Username validations' do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(6) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    pending 'username regex'
  end

  context 'Full Name validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_length_of(:full_name).is_at_least(8) }
    pending 'full name regex not permited numbers'
  end
end
