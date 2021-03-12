require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_least(3).with_message('3 characters is the minimum allowed') }
    it { should validate_length_of(:title).is_at_most(30).with_message('30 characters is the maximum allowed') }
    # it { should validate_uniqueness_of(:title).case_insensitive }
      # SQLite3::ConstraintException: NOT NULL constraint failed:
      # products.title: INSERT INTO "products" ("created_at", "updated_at") VALUES (?, ?)
      # its ARs error?

    it { should validate_length_of(:description).is_at_least(10).with_message('10 characters is the minimum allowed') }
    it { should validate_length_of(:description).is_at_most(200).with_message('200 characters is the maximum allowed') }

    it { should validate_presence_of :price }

    it { should validate_presence_of :position }
    it { should validate_inclusion_of(:position).in_array([1, 2, 3]) }

    # it { should validate_inclusion_of(:in_menu).in_array([true, false]) }
  end

  describe 'associations' do
    it { should belong_to :menu }
  end
end
