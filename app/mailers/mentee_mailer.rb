class MenteeMailer < ApplicationMailer
  default from: "WiseFriendApp@gmail.com"

  def welcome_email(mentee)
    @mentee = mentee
    mail(to: @mentee.email, subject: 'Welcome to WiseFriend!')
  end

end
