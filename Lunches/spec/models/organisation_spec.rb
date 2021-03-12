require 'rails_helper'

RSpec.describe Organisation, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(5).with_message('5 characters is the minimum allowed') }
    it { should validate_length_of(:name).is_at_most(30).with_message('30 characters is the maximum allowed') }
    it { should validate_uniqueness_of(:name).case_insensitive }

    it { should validate_presence_of :email }
    it { should allow_value('MrLin@mail.com', 'Q@a').for(:email) }
    it { should_not allow_value('  ', 'as a', 'as@fdsf@mbf').for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:email).is_at_least(3).with_message('3 characters is the minimum allowed') }
    it { should validate_length_of(:email).is_at_most(30).with_message('30 characters is the maximum allowed') }

    it { should validate_length_of(:description).is_at_least(10).with_message('10 characters is the minimum allowed') }
    it { should validate_length_of(:description).is_at_most(200).with_message('200 characters is the maximum allowed') }
  end

  describe 'associations' do
    it { should have_many :users }
  end
end
