class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] =  "New User was successfully created"
      redirect_to new_user_path
    else
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
      flash[:success] =  "User details were successfully updated"
      redirect_to edit_user_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
