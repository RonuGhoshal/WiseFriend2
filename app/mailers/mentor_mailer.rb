class MentorMailer < ApplicationMailer
  default from: "WiseFriendApp@gmail.com"

  def welcome_email(mentor)
    @mentor = mentor
    mail(to: @mentor.email, subject: 'Welcome to WiseFriend!')
  end

  def matched_email(mentor)
    @mentor = mentor
    mail(to: @mentor.email, subject: 'Thanks for confirming your match!')
  end

end
