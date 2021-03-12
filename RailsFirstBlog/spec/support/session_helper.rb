def sign_up
  visit new_user_registration_path

  fill_in :user_email, with: 'user@example.com'
  fill_in :user_username, with: 'goga'
  fill_in :user_password, with: 'secure123!@#'
  fill_in :user_password_confirmation, with: 'secure123!@#'

  click_button I18n.t 'registrations.button'
end

def user_create_article
  visit new_article_path

  fill_in :article_title, with: "#{'a' * 10}"
  fill_in :article_text, with: "#{'b' * 100}"

  click_button I18n.t 'article.new.button'
end