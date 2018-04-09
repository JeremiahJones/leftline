class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  def show
    json_response(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      json_response(@user, :created)
    else
      json_response(@user.errors, :unprocessable_entity)
    end
  end

  def update
    if @user.update(user_params)
      json_response(@user)
      head :no_content, status: :ok
    else
      json_response(@user.errors, :unprocessable_entity)
    end
  end

  def destroy
    if @user.destroy
      head :no_content, status: :ok
    else
      json_response(@user.errors, :unprocessable_entity)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:gamer_name, :email, :first_name, :last_name, :password, :password_confimration)
  end
end
