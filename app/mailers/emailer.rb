class Emailer < ActionMailer::Base
  default from: "tedx@qhoekman.nl"

  def hookup_already_taken user
  	@user = user
  	mail(:to => user, :subject => "Your hookup is already taken!")

  end
end