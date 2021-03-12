class ApiController < ApplicationController
  def index
    @day = Day.find_by(date: time_zone_now_and_strftime)
    # @organisations = Organisation.joins(users: :orders).where(orders: { day_date: @day.date })

    # да, json получился некрасивым :(
  end
end
