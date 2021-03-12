class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:user_admin?, :check_admin]

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,
                   :first_name, :last_name, :about, :organisation_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def time_zone_now_and_strftime
    Time.zone.now.to_datetime.strftime("%Y-%m-%d")
  end

  def user_admin?
    current_user.admin == true
  end

  def check_admin
    unless current_user.admin?
      redirect_to root_path, notice: I18n.t('notice.go_home')
    end
  end
end
