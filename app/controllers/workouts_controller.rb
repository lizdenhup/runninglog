class WorkoutsController < ApplicationController

  get '/workouts/new' do 
    if logged_in?
      erb :'/workouts/create_workout'
    else 
      redirect to '/login'
    end 
  end 

  get '/workouts' do 
    if logged_in?
      @workouts = Workout.all.find_all do |workout|
        workout.user_id == current_user.id 
      end 
    else
      redirect to '/login'
    end 
  end 

  post '/workouts' do 

  end 

end 