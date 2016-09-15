class UsersController < Sinatra::Base

  get '/signup' do 
    if logged_in?
      redirect to '/workouts'
      #TODO add '/workouts' route
    else 
      erb :'users/signup'
    end 
  end 

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:id] = @user.id
      redirect to '/workouts'
    end
  end

end 