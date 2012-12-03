class Hookup < ActiveRecord::Base
  attr_accessible :description,:name
  has_one :user 	#ambassadeur
  has_one :disease
  def self.is_correct? name, email
  	hookup = Hookup.where("name like ?","%#{name}%").first
  	if(hookup.user) 
  		if(hookup.user.email.to_s == email[0].to_s) 
  			return true
  		end
  	end
  	return false
  end
  def self.receive_mail message
  	name = message.subject[/^Aanmelden (\w+)$/, 1]
  	if self.is_correct? name, message.from
  		puts "Sending a e-mail"
  		Emailer.hookup_already_taken(message.from).deliver
  	else
  		puts "Add hookup"
	  	hookup = Hookup.create!([
	  		{
	  			:name => name,
	  			:description => message.body.to_s
	  		}
	  	])
	  	user = User.create!([
	  		{
	  			:email => message.from.to_s,
	  			:hookup_id => hookup.first.id
	  		}
	  	])

  	end
  end




end
