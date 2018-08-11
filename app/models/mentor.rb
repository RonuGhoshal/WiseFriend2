class Mentor < User
  has_many :mentorships
  has_many :mentees, through: :mentorships
  has_many :areas

  def match_score(mentee)
    score = 0
    mentor_skills = self.areas.map{|a| a.area_type }
    score += 40 if mentor_skills.include?(mentee.challenge1)
    score += 30 if mentor_skills.include?(mentee.challenge2)
    score += 20 if mentor_skills.include?(mentee.challenge3)
    score += 10 if self.preferred_communication == mentee.preferred_communication
    return score
  end

  def possible_matches
    Mentee.all.sort_by { |m| -match_score(m) }[0..2].select{ |m| match_score(m) > 0 }
  end

end
