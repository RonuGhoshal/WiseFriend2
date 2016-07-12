class MentorshipsController < ApplicationController

  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentee = Mentee.find(params[:mentee_id])
    @mentor = Mentor.find(session[:id])
    @mentorship = Mentorship.new(mentee_id: @mentee.id, mentor_id: @mentor.id)
    if @mentorship.save
      MentorMailer.matched_email(@mentor).deliver_later
      MenteeMailer.matched_email(@mentee).deliver_later
    end
    render :'/mentors/matches'
  end

  def show
    @mentee = Mentee.find(params[:id])
    #render :'/mentors/matches'
  end
end
