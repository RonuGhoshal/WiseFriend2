class Mentor < User
  has_many :mentees, through: :mentorships
  has_many :areas

  def match_score(mentee)
    if self.mentee_preferred_gender == 'M' && mentee.gender != "M"
      return 0
    elsif self.mentee_preferred_gender == 'F' && mentee.gender != "F"
      return 0
    elsif mentee.mentor_preferred_gender == 'M' && self.gender != "M"
      return 0
    elsif mentee.mentor_preferred_gender == 'F' && self.gender != "F"
      return 0
    end
    score = 0
    mentor_skills = self.areas.map{|a| a.area_type }
    score += 40 if mentor_skills.include?(mentee.challenge1)
    score += 30 if mentor_skills.include?(mentee.challenge2)
    score += 20 if mentor_skills.include?(mentee.challenge3)
    score += 10 if self.preferred_communication == mentee.preferred_communication
    return score
  end

  def possible_matches
    @possible_matches = Mentee.all.sort_by {|m| -match_score(m)}[0..2].select{|m| match_score(m) > 0}
  end

end
