class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters,
	if: :devise_controller?


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
		
	end
	

  def after_sign_in_path_for(resource)
  	client_users_path
  
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end