class Mentee < ActiveRecord::Base
  include BCrypt
  has_secure_password

  has_many :mentorships
  has_many :mentors, through: :mentorships

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  #validates :password, length: { minimum: 6, maximum: 20 }, on: :create

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
