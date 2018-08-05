class User < ApplicationRecord
    cattr_accessor :current_user
    devise :trackable,
           :omniauthable,
           omniauth_providers: [ :google_oauth2 ]

  has_many :mentorships

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth access_token, type
    data = access_token.info
    user = User.find_by("lower(email) = ?", data.email.downcase)
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create!(email: data['email'], first_name: data['first_name'], last_name: data['last_name'], type: type)
      if user.valid?
        logger.info "created a new user for email=#{user.email} id=#{user.id}"
      else
        logger.warn "failed to create a new user for email=#{user.email} id=#{user.id}"
      end
    end
    user
  end
end
