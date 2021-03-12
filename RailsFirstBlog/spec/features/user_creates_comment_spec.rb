require 'spec_helper'
require 'rails_helper'

feature 'Comment creation' do
  before(:each) do # if :all ----> BUG
    sign_up
  end

  # BAD
  scenario 'allows user creates comment' do
    user_create_article

    fill_in :comment_body, with: 'qwerty'

    click_button I18n.t 'article.show.button'

    expect(page).to have_content 'qwerty'
  end
end
