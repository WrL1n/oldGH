def sign_up
  locale = :en

  visit new_user_registration_path

  fill_in I18n.t('registration.username'), with: 'yepworld'
  fill_in I18n.t('registration.email'), with: 'user@example.com'
  select 'Non-organisation', from: 'user_organisation_id'
  fill_in I18n.t('registration.password'), with: 'secure123'
  fill_in I18n.t('registration.password_conf'), with: 'secure123'
  fill_in I18n.t('registration.first_name'), with: 'Ara'
  fill_in I18n.t('registration.last_name'), with: 'Cuta'
  fill_in I18n.t('registration.about'), with: 'Lorem ipsum'

  click_button I18n.t('registration.button')
end

def sign_out
  visit root_path
  click_link I18n.t('header.sign_out')
end

def sign_up_v2
  locale = :en

  visit new_user_registration_path

  fill_in I18n.t('registration.username'), with: 'yepworld_TWO'
  fill_in I18n.t('registration.email'), with: 'user@example.com_V2'
  select 'MyOrganisation', from: 'user_organisation_id'
  fill_in I18n.t('registration.password'), with: 'secure123_V2'
  fill_in I18n.t('registration.password_conf'), with: 'secure123_V2'
  fill_in I18n.t('registration.first_name'), with: 'Ara.TWO'
  fill_in I18n.t('registration.last_name'), with: 'Cuta.TWO'
  fill_in I18n.t('registration.about'), with: 'Lorem ipsum.TWO'

  click_button I18n.t('registration.button')
end
