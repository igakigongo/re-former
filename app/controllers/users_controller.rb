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

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(username: "big good name")
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      puts "user updated"
      redirect_to edit_user_path
    else
      puts "didn't work"
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
