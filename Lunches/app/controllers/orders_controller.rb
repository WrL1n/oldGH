class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = Order.new(order_params.merge!(price:
                                            total_price([order_params[:first_pos],
                                                         order_params[:second_pos],
                                                         order_params[:third_pos]])))

    # Проверяем, не пустой ли заказ
    if order_params[:first_pos].empty? &&
       order_params[:second_pos].empty? &&
       order_params[:third_pos].empty?

      redirect_to root_path, alert: I18n.t('alert.nil_order')
      return
    end

    if @order.save
      # redirect_to @order
      redirect_to root_path, notice: I18n.t('notice.order_created')
    else
      redirect_to root_path, alert: I18n.t('alert.error_create_order')
    end
  end

  private

  def order_params
    params.require(:order).permit(:day_date, :user_id, :price, :first_pos, :second_pos, :third_pos)
  end

  # наверное стоит убрать в модель?
  def total_price(array_products_id)
    Product.where(id: array_products_id).sum(:price)
  end
end
