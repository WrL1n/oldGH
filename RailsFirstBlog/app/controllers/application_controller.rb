class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::RoutingError, with: :render_not_found
  rescue_from StandardError, with: :render_server_error

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def render_not_found
    render 'shared/404', status: 404
  end

  def render_server_error
    render 'shared/500', status: 500
  end
end
