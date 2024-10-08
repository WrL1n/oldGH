class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :microposts, dependent: :destroy
end
