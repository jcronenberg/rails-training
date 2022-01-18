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
end
