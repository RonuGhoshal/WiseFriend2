class Mentorship < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :mentee
end
