class Workout < ActiveRecord::Base
#  enumerated_attribute :workout_type, %w(cycling running)
#  enumerated_attribute :unit, %w(miles km)

  belongs_to :user

  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :distance
  validates_presence_of :workout_type
  validates_presence_of :unit

end