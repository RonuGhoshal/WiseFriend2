class Mentor < User
  has_many :mentorships
  has_many :mentees, through: :mentorships

  def match_score(mentee)
    score = 0
    mentor_skills = self.areas_of_expertise
    score += 40 if mentor_skills.include?(mentee.challenge1)
    score += 30 if mentor_skills.include?(mentee.challenge2)
    score += 20 if mentor_skills.include?(mentee.challenge3)
    score += 10 if self.preferred_communication == mentee.preferred_communication
    score
  end

  def possible_matches
    mentees = Mentee.all.sort_by { |m| -match_score(m) }[0..2].select{ |m| match_score(m) > 0  && mentorships.find_by(mentee_id: m.id) == nil }
  end

end
