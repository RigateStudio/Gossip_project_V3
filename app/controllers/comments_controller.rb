class CommentsController < ApplicationController
  def index
  end

  def create
    puts params
    if logged_in?
      Comment.create(content: params["content"], user: current_user, gossip: Gossip.find(params["gossip_id"]))
      redirect_to gossip_path(params["gossip_id"])
    end  
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @p = params
    @comment = Comment.find(params[:id])
    if @comment.update(post_params)
      redirect_to gossip_path(params[:gossip_id])
    #can't use render, why??? no confirmation message then
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossips_path(params[:gossip_id])
  end

  private

  def post_params
    post_params = params.require(:comment).permit(:content)
  end
end
