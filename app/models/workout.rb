class Workout < ActiveRecord::Base
#  enumerated_attribute :workout_type, %w(cycling running)
#  enumerated_attribute :unit, %w(miles km)

  belongs_to :user

  validates_presence_of :date, on: :create
  validates_presence_of :time, on: :create
  validates_presence_of :distance, on: :create 
  validates_presence_of :workout_type, on: :create
  validates_presence_of :unit, on: :create

end