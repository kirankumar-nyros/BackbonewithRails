class Getflow < ActiveRecord::Base
	has_many :todos
	belongs_to :getflow
end
