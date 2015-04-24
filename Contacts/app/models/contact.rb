class Contact < ActiveRecord::Base

	def age
		age = Date.today.year - date_of_birth.year
		age -= 1 if Date.today < date_of_birth + age.years #for days before birthday
		age = 0 if age < 0
		return age
	end

end
