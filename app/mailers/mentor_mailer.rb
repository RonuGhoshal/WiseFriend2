class MentorMailer < ApplicationMailer
  default from: "WiseFriendApp@gmail.com"

  def welcome_email(mentor)
    @mentor = mentor
    mail(to: @mentor.email, subject: 'Welcome to WiseFriend!')
  end

end
