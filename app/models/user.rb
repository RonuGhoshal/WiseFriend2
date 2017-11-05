class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable

  has_many :mentorships

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
