require 'rails_helper'

feature 'Product creation' do
  background do
    locale = :en
    sign_up
  end

  scenario 'allows user(admin) to see the products page' do
    visit products_path
    expect(page).to have_content I18n.t('product.index.header')
  end

  scenario 'allows user(admin) to see the page creating an product' do
    visit new_product_path
    expect(page).to have_content I18n.t('product.new.header')
  end

  scenario 'allows user(admin) to see the page created an product' do
    create(:product)
    visit product_path(1)
    expect(page).to have_content I18n.t('product.show.header')
  end
end

feature 'Editing an product' do
  background do
    locale = :en
    sign_up
    create(:product)
    visit edit_product_path(1)
  end

  scenario 'allows user(admin) to see the page editing an product' do
    expect(page).to have_content I18n.t('product.edit.header')
  end

  scenario 'allows user(admin) to see the button updating product' do
    expect(page).to have_button I18n.t('product.edit.button')
  end
end

feature 'Deleting an product' do
  background do
    locale = :en
    sign_up
  end

  scenario 'allows user(admin) to see the button deleting product' do
    create(:product)
    visit edit_product_path(1)
    expect(page).to have_button I18n.t('product.edit.button_delete')
  end
end
