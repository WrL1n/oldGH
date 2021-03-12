require 'spec_helper'
require 'rails_helper'

feature 'Article editing' do
  before(:each) do
    sign_up
  end

  scenario 'allows user edit article' do
    user_create_article

    visit articles_path

    click_link I18n.t 'article_button.article_edit'

    fill_in :article_title, with: "#{'a' * 10 + 'tt'}"
    fill_in :article_text, with: "#{'b' * 100 + 'tx'}"

    click_button I18n.t 'article.edit.button'

    expect(page).to have_content "#{'a' * 10 + 'tt'}"
    expect(page).to have_content "#{'b' * 100 + 'tx'}"
  end
end
