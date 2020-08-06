module SessionsHelper
    def current_user
     User.find_by(id: session[:user_id])
    end
 
    def log_in(user)
     session[:user_id] = user.id
   end

   def logged_in?
    if session[:user_id] != nil
      return true
    else
      return false
    end
   end
 
 end