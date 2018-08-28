class Mentorship < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :mentee

  validates_uniqueness_of :mentee_id, :scope => :mentor_id
end
