class Posts < ActiveRecord::Base
  belongs_to :user
	# each post must have content and a user_id
	validates_presence_of :content, :user_id
	# content may not be longer than 140 characters in length
	validates :content, length: { maximum: 140 }
end
