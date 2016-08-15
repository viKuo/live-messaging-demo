module UsersHelper
	def current_user
		@cached_user = @cached_user || User.find_by(id:session[:user_id])
	end

	def logged_in?
		current_user != nil
	end

end
