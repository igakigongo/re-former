class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      puts "user saved"
      redirect_to new_user_path
    else
      puts "didn't work"
      render :new
    end
  end

  def new
    @user = User.new(username: "big good name")
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
