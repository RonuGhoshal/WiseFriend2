class Mentee < User
  has_many :mentorships
  has_many :mentors, through: :mentorships

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
