class CommentsController < ApplicationController
  def create
    comment = Comment.new(submitted_params)
    comment.user_id = current_user.id
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(submitted_params[:link_id])

  end

  def destroy
    comment = Comment.find(params[:id])
    link_id = comment.link_id
    comment.destroy
    redirect_to link_url(link_id)
  end

  private
  def submitted_params
    params.require(:comment).permit(:body, :link_id)

  end
end
