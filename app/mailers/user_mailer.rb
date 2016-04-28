class UserMailer < ActionMailer::Base

  def password_reset(user)
    @user = user
    mail( :to => user.email,
          :from => 'QuantoVale?',
          :subject => 'Redefinição de senha')
  end
  
end
