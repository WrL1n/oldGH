require 'rails_helper'

feature 'Uses menu:' do
  background do
    locale = :en
    sign_up
  end

  scenario 'allows admin to see menu page' do
    visit menu_path
    expect(page).to have_content Menu.first.title
  end

  scenario 'allows admin to see button \'True\' in menu table on page' do
    create(:product, :pos_1, :in_menu)
    visit menu_path
    expect(page).to have_button I18n.t('button._true')
  end

  scenario 'allows admin to click button \'True\' in menu table on page' do
    create(:product, :pos_1, :in_menu)
    visit menu_path
    click_on I18n.t('button._true')
    # После клика на кнопку перекидывает на product#show, возвращаемся назад
    visit menu_path
    expect(page).to have_button I18n.t('button._false')
  end

  scenario "allows admin to see button \'False\' in menu table on page" do
    create(:product, :pos_1, :not_in_menu)
    visit menu_path
    expect(page).to have_button I18n.t('button._false')
  end

  scenario "allows admin to see button \'False\' in menu table on page" do
    create(:product, :pos_1, :not_in_menu)
    visit menu_path
    click_on I18n.t('button._false')
    # После клика на кнопку перекидывает на product#show, возвращаемся назад
    visit menu_path
    expect(page).to have_button I18n.t('button._true')
  end
end

feature 'Orders:' do
  background do
    locale = :en
    sign_up
    create(:day_with_orders, :today)
    visit "days/#{(Time.zone.now).to_datetime.strftime("%Y-%m-%d")}"
  end

  scenario 'allows admin to see daily orders page' do
    expect(page).to have_content  I18n.t('day.show.orders')
  end

  scenario 'allows admin to see daily total price' do
    expect(page).to have_content  I18n.t('day.show.daily_total_price')
  end

  scenario 'allows admin to see daily total price for organisations' do
    expect(page).to have_content  I18n.t('day.show.daily_total_price_for_org')
  end
end
