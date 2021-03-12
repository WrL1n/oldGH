class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index]
  before_action :check_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
