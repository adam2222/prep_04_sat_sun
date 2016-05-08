class LinksController < ApplicationController
  before_action :require_logged_in_user

  def new
    render :new
  end

  def create
    @link = Link.new(links_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def index
    @links = Link.all
    render :index
  end

  def show
    @link = Link.find(params[:id])
    render :show
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(links_params)
      p "updated!"
      redirect_to link_url(@link)
    else
      p "not updated"
      flash.now[:errors] = @link.errors.full_messages
      render :edit
    end
  end

  private

  def links_params
    params.require(:link).permit(:url, :title, :user_id)

  end
end
