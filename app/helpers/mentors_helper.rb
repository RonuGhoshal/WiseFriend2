module MentorsHelper

    def challenge_converter(str)
    case str
      when 'A' then "Affordable Housing"
      when 'D' then "Drug/Alcohol Treatment"
      when 'ED' then "Educational Opportunities"
      when 'EM' then "Employment/Job Search"
      when 'F' then "Family Counseling"
      when 'MC' then "Medical Care"
      when 'MH' then "Mental Health Services"
      when 'N' then "Nonviolent Conflict Resolution"
    end
  end

  def contact_converter(str)
    case str
      when 'P' then 'Phone'
      when 'E' then 'Email'
      when 'W' then 'WiseFriend Messaging'
    end
  end

end
