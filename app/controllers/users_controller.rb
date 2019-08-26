class UsersController < ApplicationController

  def new
    @user = User.new
    @user.build_user_details
  end


  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, user_details_attributes:[:nickname, :email, :user_id, :postal_code, :address, :building,:phone_number, :prefecture_id, :city, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile])
    # params.require(:user).permit(:name, :email)
  end
end
