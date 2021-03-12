require 'spec_helper'
require 'rails_helper'

feature 'Article creation' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to visit new article page' do
    visit new_article_path
    expect(page).to have_content I18n.t 'article.new.article_new'
  end

  scenario 'allows user creates article' do
    user_create_article

    expect(page).to have_button I18n.t 'article.show.button'
  end
end
