module UsersHelper

	def get_user_age(user)
		age = ((DateTime.now - user.date_of_birth) / 365.25).to_i        
	end

	def is_current_user_has_complete_profile

		bool_is_complete = false

		if current_user.gender != nil && current_user.date_of_birth != nil
			bool_is_complete = true
		end

		return bool_is_complete
	end

end
