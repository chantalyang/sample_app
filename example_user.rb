class User
	#Creates attribute accesors (get/set) methods
	attr_accessor :name, :email

	#Initialize method = Method called when .new called
	def initialize(attributes = {}) #Takes one parameter, default attributes which is an empty hash
		#@ to denote instance variables
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
		
	end

		
	end