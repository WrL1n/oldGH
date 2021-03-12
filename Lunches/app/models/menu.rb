class Menu < ApplicationRecord
  # , -> { where in_menu: true }
  has_many :products
end
