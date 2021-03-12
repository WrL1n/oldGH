require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { should validate_presence_of :day_date }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :price }
  end

  describe 'associations' do
    it { should belong_to :day }
    it { should belong_to :user }
  end
end
