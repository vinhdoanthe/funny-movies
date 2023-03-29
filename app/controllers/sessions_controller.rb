class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      flash[:success] = "You are signed in successfully"
      session[:user_id] = user.id
    end

    if user.present? && (not user.authenticate(params[:password]))
      flash[:danger] = "Invalid password"
    end

    if not user.present?
      # Create a new user
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "User is created successfully"
      else
        flash[:danger] = helpers.build_error_message(@user.errors.full_messages)
      end
    end

    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
  def user_params
    params.permit(:username, :password)
  end
end
