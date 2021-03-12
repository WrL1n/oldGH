class Comment < ApplicationRecord
  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 5, maximum: 4000 }

  belongs_to :article
end
