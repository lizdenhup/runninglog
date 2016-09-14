class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.time :time 
      t.date :date
      t.enum :workout_type 
      t.enum :unit 
      t.text :notes
    end
  end 
end
