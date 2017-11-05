class Mentee < User
  has_many :mentors, through: :mentorships

  validates :last_name, presence: true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
