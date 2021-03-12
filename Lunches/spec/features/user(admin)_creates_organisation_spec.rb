require 'rails_helper'

feature 'Organisation creation' do
  background do
    locale = :en
    sign_up
  end

  scenario 'allows user (admin) to see the organizations page' do
    visit organisations_path
    expect(page).to have_content I18n.t('organisation.index.title')
  end

  scenario 'allows user(admin) to see the page creating an organization' do
    visit new_organisation_path
    expect(page).to have_content I18n.t('organisation.new.title')
  end

  scenario 'allows user(admin) to see the page created an organization' do
    create(:organisation)
    visit organisation_path(2)
    expect(page).to have_content I18n.t('organisation.show.title')
  end
end

feature 'Editing an organization' do
  background do
    locale = :en
    sign_up
    create(:organisation)
    visit edit_organisation_path(2)
  end

  scenario 'allows user(admin) to see the page editing an organization' do
    expect(page).to have_content I18n.t('organisation.edit.title')
  end

  scenario 'allows user(admin) to see the button updating organization' do
    expect(page).to have_button I18n.t('organisation.edit.button')
  end
end

feature 'Deleting an organization' do
  background do
    locale = :en
    sign_up
  end

  scenario 'allows user(admin) to see the button deleting organization' do
    create(:organisation)
    visit edit_organisation_path(2)
    expect(page).to have_button I18n.t('organisation.edit.button_delete_org')
  end

  # scenario 'allows user(admin) to delete organization' do
  #   create_organisation
  #   visit edit_organisation_path(2)

  #   click_button I18n.t('organisation.edit.button_delete_org')
  #   find('Ok').click

  #   expect(page).to have_button I18n.t('organisation.index.button')
  # end
end
