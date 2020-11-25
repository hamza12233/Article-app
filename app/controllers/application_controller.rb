class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action  :authenticate_user!, :except => [:index]
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:admin])
  end

  # def after_sign_up_path_for(resource)
  #   new_user_session_path
  # end
  def after_sign_in_path_for(resource)
     articles_path
  end

<<<<<<< HEAD
  
=======

>>>>>>> 7fdb0a4a20792b267914d5c69a870b229b111030
end
