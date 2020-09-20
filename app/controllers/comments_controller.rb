class CommentsController < ApplicationController
  before_action :move_to_sign_in
  
  def index
    @item = Item.find(params[:item_id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end


  def move_to_sign_in
    redirect_to new_user_path unless user_signed_in?
  end


  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
