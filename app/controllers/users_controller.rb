class UsersController < Sinatra::Base

  get '/signup' do 
    if logged_in?
      redirect to '/workouts'
      #TODO add '/workouts' route
    else 
      erb :'user/signup'
    end 
  end 
  
end 