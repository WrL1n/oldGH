class Organisation < ApplicationRecord
  validates :name,          presence: true,
                            uniqueness: { case_sensitive: false },
                            length: { minimum: 5,
                                      maximum: 30,
                                      too_long: "%{count} characters is the maximum allowed",
                                      too_short: "%{count} characters is the minimum allowed" }

  validates :email,         presence: true,
                            uniqueness: { case_sensitive: false },
                            format: { with: /\A[^@\s]+@[^@\s]+\z/,
                                      message: 'allows only letters and some characters' },
                            length: { minimum: 3,
                                      maximum: 30,
                                      too_long: "%{count} characters is the maximum allowed",
                                      too_short: "%{count} characters is the minimum allowed" }

  validates :description,   length: { minimum: 10,
                                      maximum: 200,
                                      too_long: "%{count} characters is the maximum allowed",
                                      too_short: "%{count} characters is the minimum allowed" }

  has_many :users, dependent: :destroy
end
