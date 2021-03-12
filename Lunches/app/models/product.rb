class Product < ApplicationRecord
  belongs_to :menu

  validates :title,         presence: true,
                            uniqueness: { case_sensitive: false },
                            length: { minimum: 3,
                                      maximum: 30,
                                      too_long: "%{count} characters is the maximum allowed",
                                      too_short: "%{count} characters is the minimum allowed" }

  validates :description,   length: { minimum: 10,
                                      maximum: 200,
                                      too_long: "%{count} characters is the maximum allowed",
                                      too_short: "%{count} characters is the minimum allowed" }

  validates :price,         presence: true
  validates :position,      presence: true,
                            inclusion: { in: [1, 2, 3] }

  validates :in_menu,       inclusion: { in: [true, false] }

  validates :path_to_image, file_size: { less_than: 1.megabytes }

  mount_uploader :path_to_image, PathToImageUploader
end
