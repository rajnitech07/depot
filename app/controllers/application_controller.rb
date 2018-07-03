class ApplicationController < ActionController::Base
 before_action :set_paper_trail_whodunnit
 before_action :authorize
 protect_from_forgery with: :exception

def user_for_paper_trail
    User.find(session[:user_id]) if session[:user_id]
end


 
protected

  
  def authorize
  	unless User.find_by(id: session[:user_id])
  		redirect_to login_url, notice: "Please log in"
    end
  end
end
