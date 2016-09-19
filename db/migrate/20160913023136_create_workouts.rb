class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.time :time 
      t.date :date
      t.string :workout_type 
      t.float :distance
      t.string :unit 
      t.text :notes
    end
  end 
end
