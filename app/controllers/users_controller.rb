class UsersController < ApplicationController
  def index
    @users = User.filter_users(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @technologies = @user.technologies
  end

  def edit
    @user = User.find(params[:id])
    @technologies = Technology.filter_tech(@user)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "edited"
      redirect_to users_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name,:last_name)
    end
end