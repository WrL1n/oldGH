require 'spec_helper'
require 'rails_helper'

RSpec.describe Article do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :text }

    it do
      should validate_length_of(:title).is_at_least(10).is_at_most(140)
    end

    it do
      should validate_length_of(:text).is_at_least(100).is_at_most(4000)
    end
  end

  describe 'associations' do
    it { should have_many :comments }
  end

  describe '#subject' do
    it 'returns the artice title' do
      # Создаем объект article
      article = create(:article, title: 'Lorem Ipsum')

      # assert, проверка
      expect(article.subject).to eq 'Lorem Ipsum'
    end
  end

  describe '#last_comment' do
    it 'returns the last comment' do
      # создаем статью с комментариями (3)
      article = create(:article_with_comments)

      # проверка
      expect(article.last_comment.body).to eq 'comment body 3'
    end
  end
end
