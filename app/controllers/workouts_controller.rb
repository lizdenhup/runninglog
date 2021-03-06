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
      @workout = Workout.find_by_id(params[:id])
      erb :'workouts/show_workout'
    else
      redirect to '/login'
    end 
  end 

  get '/workouts/:id/edit' do 
    if logged_in? 
      @workout = Workout.find_by_id(params[:id])
      erb :'/workouts/edit_workout'
    end 
  end 

    get '/workouts' do 
    if logged_in?
      @workouts = current_user.workouts
      erb :'/workouts/workouts'
    else
      redirect to '/login'
    end 
  end 

  post '/workouts' do 
    if logged_in?
      @workout = Workout.new(time: params[:time], date: params[:date], workout_type: params[:workout_type], distance: params[:distance], unit: params[:unit], notes: params[:notes], user_id: current_user.id)
  #    binding.pry
      if @workout.save
        redirect to "/workouts/#{@workout.id}"
      else 
        erb :'/workouts/create_workout'
      end 
    else
      redirect to '/login'
    end 
  end 

  patch '/workouts/:id' do 
    @workout = Workout.find_by_id(params[:id])
    @workout.time = params[:time] 
    @workout.date = params[:date]
    @workout.workout_type = params[:workout_type]
    @workout.distance = params[:distance] 
    @workout.unit = params[:unit] 
    @workout.notes = params[:notes] 
    if @workout.save 
      redirect to "/workouts/#{@workout.id}"
    else 
      erb :'/workouts/edit_workout'
    end 
  end

  delete '/workouts/:id/delete' do 
    @workout = Workout.find_by_id(params[:id])
    if logged_in? && @workout.user_id == session[:id]
      @workout.destroy
      redirect to '/workouts'
    else
      redirect to "/workouts/#{@workout.id}"
    end 
  end 

end 