class Post < ActiveRecord::Base
	# each post must have an author and some content
	validates_presence_of :author, :content
	# content may not be longer than 140 characters in length
	validates :content, length: { maximum: 140 }
end
