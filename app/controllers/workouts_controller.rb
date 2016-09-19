require 'pry'

class WorkoutsController < ApplicationController

  get '/workouts/new' do 
    if logged_in?
      erb :'/workouts/create_workout'
    else 
      redirect to '/login'
    end 
  end 

  get '/workouts/:id' do 
    if logged_in?
      binding.pry
      @workout = Workout.find_by_id(params[:id])
      erb :'workouts/show_workout'
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
    if logged_in?
      @workout = Workout.new(time: params[:time], date: params[:date], workout_type: params[:workout_type], distance: params[:distance], unit: params[:unit], notes: params[:notes])
      if @workout.save
        redirect to "/workouts/#{@workout.id}"
      else 
        redirect to '/workouts/new'
      end 
    else
      redirect to '/login'
    end 
  end 

end 