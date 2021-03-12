# require 'spec_helper'
require 'rails_helper'

feature 'visible pages for guest:' do
  background do
    locale = :en
  end

  scenario 'allows guest to see home page' do
    visit root_path

    expect(page).to have_content I18n.t('home.hello')
  end
end

feature 'visible creation account page for guest' do
  background do
    locale = :en
    visit new_user_registration_path
  end

  scenario { expect(page).to have_content I18n.t('registration.sign_up') }
  scenario { expect(page).to have_content I18n.t('registration.username') }
  scenario { expect(page).to have_content I18n.t('registration.email') }
  scenario { expect(page).to have_content I18n.t('registration.password') }
  scenario { expect(page).to have_content I18n.t('registration.password_conf') }
  scenario { expect(page).to have_content I18n.t('registration.first_name') }
  scenario { expect(page).to have_content I18n.t('registration.last_name') }
  scenario { expect(page).to have_content I18n.t('registration.about') }
end

feature 'visible login page for guest' do
  background do
    locale = :en
    visit new_user_session_path
  end

  scenario { expect(page).to have_content I18n.t('session.sign_in') }
  scenario { expect(page).to have_content I18n.t('session.email') }
  scenario { expect(page).to have_content I18n.t('session.password') }
  scenario { expect(page).to have_content I18n.t('session.remember_me') }
  scenario { expect(page).to have_content I18n.t('session.button') }
end

feature 'invisible users pages for guest:' do
  background do
    locale = :en
  end

  scenario 'doesn`t allows guest to see users(#index) page' do
    visit users_path

    expect(page).not_to have_content I18n.t('users.index.title')
  end

  scenario 'doesn`t allows guest to see users(#edit) page' do
    visit edit_user_registration_path

    expect(page).not_to have_content I18n.t('edit.edit')
  end

  scenario 'doesn`t allows guest to see users(#show) page' do
    create(:user)
    visit user_path(1)

    expect(page).not_to have_content I18n.t('users.show.title')
  end
end

feature 'invisible organisations pages for guest:' do
  background do
    locale = :en
  end

  scenario 'doesn`t allows guest to see organisations(#index) page' do
    visit organisations_path

    expect(page).not_to have_content I18n.t('organisation.index.title')
  end

  scenario 'doesn`t allows guest to see organisations(#new) page' do
    visit new_organisation_path

    expect(page).not_to have_content I18n.t('organisation.new.title')
  end

  scenario 'doesn`t allows guest to see organisations(#show) page' do
    create(:organisation)
    visit organisation_path(1)
    expect(page).not_to have_content I18n.t('organisation.show.title')
  end

  scenario 'doesn`t allows guest to see organisations(#edit) page' do
    create(:organisation)
    visit edit_organisation_path(1)
    expect(page).not_to have_content I18n.t('organisation.edit.title')
  end
end

feature 'invisible products pages for guest:' do
  background do
    locale = :en
  end

  scenario 'doesn`t allows guest to see products(#index) page' do
    visit products_path

    expect(page).not_to have_content I18n.t('product.index.header')
  end

  scenario 'doesn`t allows guest to see products(#show) page' do
    create(:product)
    visit product_path(1)

    expect(page).not_to have_content I18n.t('product.show.header')
  end

  scenario 'doesn`t allows guest to see products(#edit) page' do
    create(:product)
    visit edit_product_path(1)

    expect(page).not_to have_content I18n.t('product.edit.header')
  end
end

feature 'invisible pages for guest:' do
  background do
    locale = :en
  end

  scenario 'doesn`t allows guest to see menu page' do
    visit menu_path

    expect(page).not_to have_content 'Daily menu'
  end

  scenario 'doesn`t allows guest to see creation order page' do
    visit "days/#{Time.zone.now.to_datetime.strftime("%Y-%m-%d")}"

    expect(page).not_to have_button I18n.t('day.show.create_order')
  end

  scenario 'doesn`t allows guest to see showing order page' do
    visit "days/#{Time.zone.now.to_datetime.strftime("%Y-%m-%d")}"

    expect(page).not_to have_button I18n.t('day.show.button_back')
  end
end
