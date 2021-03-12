class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, dependent: :destroy
  belongs_to :organisation

  validates :username,          presence: true,
                                uniqueness: { case_sensitive: false },
                                length: { minimum: 3,
                                          maximum: 30,
                                          too_long: "%{count} characters is the maximum allowed",
                                          too_short: "%{count} characters is the minimum allowed" }
  validates :organisation_id,   presence: true

  validates :first_name,        presence: true,
                                format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                                          message: 'allows only letters and some characters' },
                                length: { minimum: 3,
                                          maximum: 30,
                                          too_long: "%{count} characters is the maximum allowed",
                                          too_short: "%{count} characters is the minimum allowed" }
  validates :last_name,         presence: true,
                                format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                                          message: "allows only letters and some characters" },
                                length: { minimum: 3,
                                          maximum: 30,
                                          too_long: "%{count} characters is the maximum allowed",
                                          too_short: "%{count} characters is the minimum allowed" }
  validates :admin,             inclusion: { in: [true, false] }

  after_create :set_admin

  private

  def set_admin
    if User.count == 1
      User.first.update_attribute(:admin, true)
    else
      true
    end
  end
end
