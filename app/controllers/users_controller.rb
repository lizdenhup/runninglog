class UsersController < ApplicationController

  get '/signup' do 
    if logged_in?
      redirect to '/users/#{current_user.slug}'
    else 
      erb :'users/signup'
    end 
  end 

  get '/users/:slug' do 
    if @user = User.find_by_slug(params[:slug])
      @workouts = @user.workouts
      erb :'users/show_user'
    else 
      redirect to '/'
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