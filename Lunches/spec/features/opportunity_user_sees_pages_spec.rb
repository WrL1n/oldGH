require 'rails_helper'

feature 'visible pages for user' do
  background do
    locale = :en
    sign_up
    create(:organisation)
    sign_out
    sign_up_v2
  end

  scenario 'allows user to see home page' do
    visit root_path
    expect(page).to have_content 'Hi! This`s a test project. Don`t expect high quality, ty ^^'
  end

  scenario 'allows user to see users(#edit) page' do
    visit edit_user_registration_path
    expect(page).to have_content I18n.t('edit.edit')
  end

  scenario 'allows user to see his user profile (users#show) page' do
    visit user_path(2)
    expect(page).to have_content I18n.t('users.show.title')
  end

  scenario 'allows user to see link to creating order' do
    visit root_path
    expect(page).to have_content Time.zone.now.to_datetime.strftime("%Y-%m-%d")
  end
end

# Т.к. первый пользователь у нас всегда админ,
# нам нужен еще один пользотель, у которого будет id=2,
# и он не сможет смотреть список всех user`ов
feature 'invisible pages for user' do
  background do
    locale = :en
    sign_up
    create(:organisation)
    sign_out
    sign_up_v2
  end

  scenario 'doesn`t allows user to see users(#index) page' do
    visit users_path
    expect(page).not_to have_content I18n.t('users.index.title')
  end

  scenario 'doesn`t allows user to see not your profile (users#show) page' do
    visit user_path(1)
    expect(page).not_to have_content I18n.t('users.show.title')
  end

  scenario 'doesn`t allows user to see not your profile (users#show) page' do
    visit user_path(1)
    expect(page).not_to have_content I18n.t('users.show.title')
  end

  scenario 'doesn`t allows user to see organisations(#index) page' do
    visit organisations_path
    expect(page).not_to have_content I18n.t('organisation.index.title')
  end

  scenario 'doesn`t allows user to see organisations(#new) page' do
    visit new_organisation_path
    expect(page).not_to have_content I18n.t('organisation.new.title')
  end

  scenario 'doesn`t allows user to see organisations(#show) page' do
    create(:organisation)
    visit organisation_path(1)
    expect(page).not_to have_content I18n.t('organisation.show.title')
  end

  scenario 'doesn`t allows user to see organisations(#edit) page' do
    create(:organisation)
    visit edit_organisation_path(1)
    expect(page).not_to have_content I18n.t('organisation.edit.title')
  end

  scenario 'doesn`t allows user to see products(#index) page' do
    visit products_path
    expect(page).not_to have_content I18n.t('product.index.header')
  end

  scenario 'doesn`t allows user to see products(#show) page' do
    create(:product)
    visit product_path(1)
    expect(page).not_to have_content I18n.t('product.show.header')
  end

  scenario 'doesn`t allows user to see products(#edit) page' do
    create(:product)
    visit edit_product_path(1)
    expect(page).not_to have_content I18n.t('product.edit.header')
  end
end
