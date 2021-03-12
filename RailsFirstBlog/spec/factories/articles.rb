FactoryGirl.define do
  factory :article do
    title { 'a' * rand(10..140) }
    text { 'b' * rand(100..4000) }

    # Создаем фабрику с названием article_with_comments
    # для создания статьи с несколькими комментариями
    factory :article_with_comments do
      transient do
        posts_count 3
      end

      # После создания article
      after :create do |article, evaluator|
        # созданием список из 3-х комментариев
        create_list :comment, evaluator.posts_count, article: article
      end
    end
  end
end
