class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?, :authorized?

  def authorized? id
    teacher_session == id.to_i
  end

  def admin?
    current_user.admin
  end

end
