class Order < ApplicationRecord
  belongs_to :day, foreign_key: 'day_date', primary_key: 'date'
  belongs_to :user

  validates :day_date, presence: true
  validates :user_id, presence: true
  validates :price, presence: true
end
