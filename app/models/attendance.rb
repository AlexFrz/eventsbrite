
class Attendance < ApplicationRecord
	after_create :attendance_send

	belongs_to :user
	belongs_to :event

	# Each time someone participates to an event, organizer receives a recap email via
	# this method
	def attendance_send
		AttendanceMailer.participation_email(self.user, self.event.organizer, self.event).deliver_now
	end

end