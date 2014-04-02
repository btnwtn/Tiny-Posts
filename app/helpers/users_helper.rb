module UsersHelper
	def gravatar_url(size=20)
		# asumes user is logged in.
		hashed_email = Digest::MD5.hexdigest(current_user.email)
		"http://www.gravatar.com/avatar/#{hashed_email}?s=#{size}"
	end

	def gravatar_url_for(email, size=20)
		hashed_email = Digest::MD5.hexdigest(email)
		"http://www.gravatar.com/avatar/#{hashed_email}?s=#{size}"
	end
end
