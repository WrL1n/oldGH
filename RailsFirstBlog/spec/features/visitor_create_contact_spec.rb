require 'spec_helper'
require 'rails_helper'

feature 'Contact creation' do
  scenario 'allows access to contacts page' do
    visit '/contacts'

    expect(page).to have_content I18n.t 'contacts.contact_us'
  end

  scenario 'allows a guest to create contact' do
    visit '/contacts'

    fill_in :contact_email, with: 'user@example.com'
    fill_in :contact_message, with: 'something'

    click_button I18n.t 'contacts.button'

    expect(page).to have_content I18n.t 'contacts.thanks'
  end
end
