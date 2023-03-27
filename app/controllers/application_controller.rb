class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def authenticate_user!
    if not Current.user.present?
      flash[:danger] = "You need to sign in or sign up before continuing."
      redirect_to root_path
    end
  end
end
