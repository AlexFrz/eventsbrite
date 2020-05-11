class User < ApplicationRecord
    has_many :attendances
	has_many :events, through: :attendances
	has_many :organizers, foreign_key: "organizer_id", class_name: "Event"
end
