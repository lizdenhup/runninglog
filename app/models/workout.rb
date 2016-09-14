require 'enumerated_attribute'

class Workout < ActiveRecord::Base
  enumerated_attribute :workout_type, %w(cycling running)
  enumerated_attribute :unit, %w(miles km)
end