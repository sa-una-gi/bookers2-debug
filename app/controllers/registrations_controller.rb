class Users::RegistrationsController < Devise::RegistrationsController # deviseの該当クラスを継承させる
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
