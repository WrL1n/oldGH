FactoryBot.define do
  factory :order do
    # Refactoring later
    # Создаем order, но он ссылается на несуществующие product
    sequence(:first_pos) { |n| n }
    sequence(:second_pos) { |n| n + 1 }
    sequence(:third_pos) { |n| n + 2 }
    sequence(:price) { |n| rand(1..5.99 + n) }

    # sequence(:first_pos) { create(:product, :pos_1).id }
    # sequence(:second_pos) { create(:product, :pos_2).id }
    # sequence(:third_pos) { create(:product, :pos_3).id }
    # sequence(:price) { |n| Product.where(id: Product.last(3)).sum(:price) }

    # first_pos (create(:product, :pos_1).id)
    # second_pos (create(:product, :pos_2).id)
    # third_pos (create(:product, :pos_3).id)

    user
    day
  end
end
