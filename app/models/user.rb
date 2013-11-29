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
 
 def User.new_remember_token #Create new remember token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token) #Encrypt Token Method
    Digest::SHA1.hexdigest(token.to_s) #Conver to string in case blank tokens (only in tests)
  end

  private 
  #Method indented to show method is private
    def create_remember_token #Create Token Method 
      self.remember_token = User.encrypt(User.new_remember_token)
    	#Use self to create token for current user object
    end
end
