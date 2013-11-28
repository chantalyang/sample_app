class User < ActiveRecord::Base
	before_save{ email.downcase! } #Before saving, make email lowercase
	validates(:name, presence: true, length: { maximum: 50})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates(:email, presence: true,
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: {case_sensitive: false}
		)
	has_secure_password
	validates :password, length: { minimum: 6 } #Validation for password min 6 items
end
