class SessionsController < ApplicationController

  def new
  end

  def create
    user =  User.authenticate_by(email: params[:email], password: params[:password])

    if user
      login(user)
      redirect_to root_path, notice: "You have logged in!"
    else
      flash[:alert] = "Wrong email or password!"

      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout(current_user)
    redirect_to root_path, notice: "You have been logged out!"
  end
end
