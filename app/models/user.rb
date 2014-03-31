class User < ActiveRecord::Base
	has_secure_password
	has_many :posts

	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email
end
