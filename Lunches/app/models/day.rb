class Day < ApplicationRecord
  self.primary_key = 'date'

  has_many :orders, dependent: :destroy, foreign_key: 'day_date', primary_key: 'date'
end
