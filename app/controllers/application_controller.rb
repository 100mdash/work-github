class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_inactive_sign_in_path_for(resource)
    public_root_path(resource)
  end

  def after_customer_sign_in_path_for(resource)
    public_root_path(resource)
  end

  def after_admins_sign_in_path_for(resource)
    admin_items_path(resource)
  end

  def after_sign_out_path_for(resource)
    public_root_path(resource) # ログアウト後に遷移するpathを設定
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
