class MentorshipsController < ApplicationController
  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentee = Mentee.find(params[:id])
    @mentor = Mentor.find(session[:id])
    Mentorship.create(mentee_id: @mentee.id, mentor_id: @mentee.id)
    erb :'/mentors/matches'
  end
end
