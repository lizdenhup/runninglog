require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do 
    # set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, 'triathlon'
  end 

  get '/' do 
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else 
    erb :index
    end 
  end 

  helpers do 
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end 
  end 

end 