class ApplicationController < ActionController::Base
  
  @favorite_courts
  
  before_action:configure_permitted_parameters,if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:age,:years_of_experience,:level])
  end

end
