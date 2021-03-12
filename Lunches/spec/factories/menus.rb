FactoryBot.define do
  factory :menu do
    # title "Factory menu"
    sequence(:title) { |n| "Factory menu #{n}" }

    # Создание менюю и 5 продуктов
    # продукты рандомно входят\отсутствуют(in_menu: true\false) в меню
    # create(:menu_and_products)
    factory :menu_and_products do
      transient do
        products_count 5
      end

      after(:create) do |menu, evaluator|
        create_list(:product, evaluator.products_count, menu: menu)
      end
    end

    # Создание менюю c 3 продуктов
    # продукты входят(in_menu: true) в меню
    # create(:menu_with_products)
    factory :menu_with_products do
      transient do
        products_count 3
      end

      after(:create) do |menu, evaluator|
        create_list(:product_in_menu, evaluator.products_count, menu: menu)
      end
    end
  end
end
