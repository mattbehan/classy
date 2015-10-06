class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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

end
