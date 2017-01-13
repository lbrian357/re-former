class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(whitelist_user_params)

    if @user.save

      redirect_to new_user_path
    else
      puts @user.errors.messages
      render :new
    end
  end

  def edit

    @user = User.find_by(id:params[:id])

  end

  def update
    @user = User.find_by(id:params[:id])
    if @user.update(whitelist_user_params)

      redirect_to edit_user_path
    else
      puts @user.errors.messages
      render :edit
    end
  end

  private

  def whitelist_user_params
    params.require(:user).permit(:username,:email,:password)
  end

end


