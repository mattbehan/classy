class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_teacher!, except: [:new_session]
  protect_from_forgery with: :exception

  helper_method :admin?, :authorized?, :not_admin?, :allowed?

  def authorized? input_id
    current_teacher.id == input_id.to_i
  end

  def admin?
    current_teacher.admin
  end

  def not_admin?
    unless admin?
      redirect_to "/teachers/not_admin"
    end
  end

  def allowed? id
    unless authorized?(id)
      redirect_to "/teachers/not_authorized"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end

end
