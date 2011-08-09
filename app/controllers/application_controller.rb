class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
  
  private

  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource_or_scope)
    items_path
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
end
