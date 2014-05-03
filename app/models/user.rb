class User < ActiveRecord::Base
	has_secure_password
  # if a user is deleted, delete all their posts
	has_many :posts, dependent: :destroy

	validates_presence_of :password, :on => :create
	validates_presence_of :password_confirmation, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email, :username
end
