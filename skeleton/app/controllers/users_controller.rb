class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(submitted_params)

    if @user.save
      log_in(@user)
      redirect_to links_url
    else
      flash[:errors] = ["User already exists"]

      render :new
    end
  end






  private
  def submitted_params
    params.require(:user).permit(:username, :password)

  end

end
