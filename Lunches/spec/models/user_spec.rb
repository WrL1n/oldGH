# require 'spec_helper'
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_length_of(:username).is_at_least(3).with_message('3 characters is the minimum allowed') }
    it { should validate_length_of(:username).is_at_most(30).with_message('30 characters is the maximum allowed') }
    it { should validate_uniqueness_of(:username).case_insensitive }

    it { should validate_presence_of :organisation_id }

    it { should validate_presence_of :email }
    it { should allow_value('MrLin@mail.com', 'Q@a').for(:email) }
    it { should_not allow_value('  ', 'asd a', 'as@fdsf@mbf').for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(6).with_message('is too short (minimum is 6 characters)') }
    it { should validate_length_of(:password).is_at_most(128).with_message('is too long (maximum is 128 characters)') }

    it { should validate_presence_of :first_name }
    it { should allow_value('Mr.', 'Lin').for(:first_name) }
    it { should_not allow_value('_Mr', '0Lin').for(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(3).with_message('3 characters is the minimum allowed') }
    it { should validate_length_of(:first_name).is_at_most(30).with_message('30 characters is the maximum allowed') }

    it { should validate_presence_of :last_name }
    it { should allow_value('Mr.', 'Lin').for(:last_name) }
    it { should_not allow_value('_Mr', '0Lin').for(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(3).with_message('3 characters is the minimum allowed') }
    it { should validate_length_of(:last_name).is_at_most(30).with_message('30 characters is the maximum allowed') }

    # it { should validate_inclusion_of(:admin).in_array([true, false]) }
  end

  describe 'associations' do
    it { should have_many :orders }
    it { should belong_to :organisation }
  end

  context '#set_admin' do
    it 'verifies that the first user is an administrator' do
      create(:user)
      # user = create(:admin)
      expect(User.first.admin).to eq true
    end
  end
end
