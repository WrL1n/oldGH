module ApplicationHelper
  def user_admin?
    current_user.admin == true
  end

  def redirect_to_root
    controller.redirect_to(root_path, notice: I18n.t('notice.go_home'))
  end

  def full_name(user)
    user.first_name + ' ' + user.last_name
  end
end
