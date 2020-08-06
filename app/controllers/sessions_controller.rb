#cré une instance de class pour chaque User qui se connect a site
#Garde un hash en mémoir juqu'a la fermeture du navigateur de la part du user.
class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:email])
      
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id 
            redirect_to root_path
        else
          flash.now[:danger] = "le mot de passe ne correspond pas à l'email fourni"
          render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path

    end
    
    
end