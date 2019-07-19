class UserSignUpMailer < Devise::Mailer
  helper :application
  default from: 'announcements@tcmottc.org'
  def notification_user_signup(user)
    
    @user = user
    # @url  = 'http://example.com/login'
    mail(to: 'jmp521@gmail.com', subject: "#{user.profile.first_name} #{user.profile.last_name} has signed up")

  end

  
end
