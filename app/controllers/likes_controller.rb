class LikesController < ApplicationController
    before_action :authenticate_user, only: [:create, :destroy]
    
    def create
        
        Like.create(gossip: Gossip.find(params["gossip_id"]), user: current_user)  
        redirect_to gossip_path(params["gossip_id"])

    end

    def destroy

        Like.find(params["id"]).destroy
        redirect_to gossip_path(params["gossip_id"])
    end

    private

    def authenticate_user
        unless current_user
          flash[:danger] = "Please log in."
          redirect_to new_session_path
        end
    end

end