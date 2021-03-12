FactoryGirl.define do
  factory :comment do
    author 'Bob'

    sequence(:body) { |n| "comment body #{n}" }

    article
  end
end
