class RequestMailer < ApplicationMailer

	default from: 'admin@twogo.com'

	def request_email(poster, guest, post)
		@poster = poster
		@guest = guest
		@post = post
		mail(to: @poster.email, subject: 'You have a request from TwoGo')
	end
end
