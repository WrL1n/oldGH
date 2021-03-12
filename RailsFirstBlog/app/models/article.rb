class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10, maximum: 140 }
  validates :text, presence: true, length: { minimum: 100, maximum: 4000 }
  validates :user, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
