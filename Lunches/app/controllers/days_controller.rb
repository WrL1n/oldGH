class DaysController < ApplicationController
  before_action :authenticate_user!

  def show
    @day = Day.find(params[:date])
    @menu = Menu.first
    @order = Order.find_by(day_date: @day.date, user_id: current_user.id)
    @organisations = Organisation.where.not(name: 'Non-organisation').order(id: :asc)

    # Проверяем случаи, когда юзер переходит на день в прошлом и не имеет заказ
    if @order.nil? && time_zone_now_and_strftime > @day.date && !user_admin?
      redirect_to root_path, notice: I18n.t('notice.train_left')
    end
  end
end
