class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  # Изначально в БД уже есть одно меню (seed.rb),
  # поэтому мы можем сразу же взять его.
  # По-хорошему, если мы добавим функционал по добавлению новых меню,
  # то это придётся рефакторить :/
  def show
    @menu = Menu.first
  end

  private

  def menu_params
    params.require(:menu).permit(:title)
  end
end
