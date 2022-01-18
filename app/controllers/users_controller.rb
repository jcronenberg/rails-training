class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    permitted_params = params.require(:user).permit(:username, :password)

    @user = User.new(permitted_params)
    if @user.save
      flash.now[:ok] = 'Created new account'
    else
      flash.now[:error] = "Error creating user: #{@user.errors.full_messages.to_sentence}"
    end

    render :new
  end

  def login
    @user = User.new
  end

  def login_perform
    permitted_params = params.require(:user).permit(:username, :password)

    @user = User.find_by(username: permitted_params[:username])

    if @user&.authenticate(permitted_params[:password])
      flash.now[:ok] = 'You\'re logged in!'
      session[:user_id] = @user.id
    else
      flash.now[:error] = 'Failed to log in'
      @user = User.new
    end

    render :login
  end
end
