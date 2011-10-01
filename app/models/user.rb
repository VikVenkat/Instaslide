class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :stripe_customer_id
  
  
  has_many :slides
  has_many :whiteboards

  def self.check_existence_or_make_user_with_email(email)
		user = User.find_by_email(email)
		if user
			return user
		else
			new_user = User.new
			random_password = User.generate_random_password
			new_user.email = email
			new_user.password = random_password
			new_user.password_confirmation = random_password
			new_user.save
			new_user.reload
			#new_user.send_welcome_email_signup
			return new_user
		end
	end

	def self.generate_random_password
		#generate a random string consisting of strings and digits
		chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
		newpass = ""
		1.upto(10) { |i| newpass << chars[rand(chars.size-1)] }
		return newpass
	end

	def self.has_payment_info?
		!!self.stripe_customer_id?
	end
  
end
