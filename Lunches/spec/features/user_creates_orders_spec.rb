require 'rails_helper'

feature 'Orders(see page):' do
  background do
    locale = :en
    sign_up
    create(:organisation)
    sign_out
    sign_up_v2
    create(:day, :today)
    visit "days/#{(Time.zone.now).to_datetime.strftime("%Y-%m-%d")}"
  end

  scenario 'allows user to see daily orders page' do
    expect(page).to have_content I18n.t('day.show.today_on_menu')
  end

  scenario "allows user to see button \'create order\' daily orders page" do
    expect(page).to have_button I18n.t('day.show.create_order')
  end
end

feature 'Orders:' do
  background do
    locale = :en
    sign_up
    create(:organisation)
    sign_out
    sign_up_v2
    create(:day, :today)

    create(:product, :in_menu, :pos_1)
    create(:product, :in_menu, :pos_2)
    create(:product, :in_menu, :pos_3)
    visit "days/#{(Time.zone.now).to_datetime.strftime("%Y-%m-%d")}"

    # Хз почему создаются продукты с "1",
    # хотя должны с 1..3, как в консоли
    # Lorem ipsum hot 1, Lorem ipsum hot 2 и т.д.
    # Надо будет потом разобраться :/
    select('Lorem ipsum hot 1', from: "order_first_pos")
    select('Lorem ipsum hot 1', from: "order_second_pos")
    select('Lorem ipsum hot 1', from: "order_third_pos")

    click_on I18n.t('day.show.create_order')
  end

  scenario 'allows user to create order' do
    expect(page).to have_content I18n.t('notice.order_created')
  end

  scenario 'allows user to see him order' do
    visit "days/#{(Time.zone.now).to_datetime.strftime("%Y-%m-%d")}"
    expect(page).to have_content I18n.t('day.show.you_order')
  end
end
