class UsersController < ApplicationController

  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    @roles = [ ["student", 0], ["ta", 1], ["instructor", 2], ["admin", 3] ]
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
      UpdateRoleMailer.role_change_notification(@user, current_user).deliver
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end


  private

  def secure_params
    params.require(:user).permit(:role)
  end

end
