class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def index
    @gossip = false
  end

  def new
    @gossip = Gossip.new
    @tags = Tag.all
  end

  def create
    puts "$"*60
    puts params["title"]
    puts params["content"]
  
    @gossip = Gossip.new(title: params["title"], content: params["content"], user: User.find_by(first_name: "anonymous"),)

    @gossip.user = current_user

    if @gossip.save
      params.keys.each do |key|
        @gossip.tags << Tag.find(params["#{key}"]) if key.tr("0-9", "") == "tag"
      end 
      render :index
    else
      @tags = Tag.all
      render :new
    end
    
    puts params.keys
  end

  def show
    @gossip = Gossip.find(params[:id])
    @id = params[:id]
  end

  def edit
      @gossip = Gossip.find(params[:id])
    unless logged_in? && @gossip.user.id == current_user.id
      redirect_to gossip_path(@gossip.id)
    end
  end
  
  def update
    puts @p = params
    @gossip = Gossip.find(params[:id])
      if @gossip.update(post_params)
        render :index
      else
        render :edit
      end
  end 

  def destroy 
      @gossip = Gossip.find(params[:id])
      if @gossip.user.id == current_user.id
        @gossip.destroy
      end
    redirect_to gossips_path
  end
  
  private

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end


  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end