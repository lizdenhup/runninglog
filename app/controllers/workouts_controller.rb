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
      #TODO figure out how to resubmit forms with
      #the proper radio button checked (ie the 
      #radio button that was active upon initial
      #submission)
    end 
  end 

    get '/workouts' do 
    if logged_in?
      @workouts = Workout.all.find_all do |workout|
        workout.user_id == current_user.id 
      end 
      erb :'/workouts/workouts'
    else
      redirect to '/login'
    end 
  end 

  post '/workouts' do 
    if logged_in?
      @workout = Workout.new(time: params[:time], date: params[:date], workout_type: params[:workout_type], distance: params[:distance], unit: params[:unit], notes: params[:notes], user_id: current_user.id)
      if @workout.save
        redirect to "/workouts/#{@workout.id}"
      else 
        redirect to '/workouts/new'
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
    @workout.save 
    redirect to "/workouts/#{@workout.id}"
  end

  delete '/workouts/:id/delete' do 

  end 

end 