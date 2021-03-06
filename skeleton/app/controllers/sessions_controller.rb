class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      log_in(@user)
      redirect_to links_url
    else
      flash[:errors] = ["error"]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to new_session_url
  end


  def new
    render :new
  end



end
