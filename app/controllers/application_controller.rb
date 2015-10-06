class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_teacher!
  protect_from_forgery with: :exception

  helper_method :admin?, :authorized?, :not_admin?, :allowed?, :must_be_signed_in

  def authorized? id
    teacher_session == id.to_i
  end

  def admin?
    current_teacher.admin
  end

  def not_admin?
    unless admin?
      redirect_to "/teachers/not_admin"
    end
  end

  def allowed? authorization_status
    unless authorization_status
      redirect_to "/teachers/not_authorized"
    end
  end

  def must_be_signed_in
    unless teacher_signed_in?
      redirect_to login_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end

end
