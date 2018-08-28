class MentorshipsController < ApplicationController

  def index
  end

  def new
    @mentorship = Mentorship.new
  end

  def create
    @mentorship = Mentorship.new(mentee_id: params[:mentee_id], mentor_id: params[:mentor_id])
    if @mentorship.save!
      MentorMailer.matched_email(@mentorship.mentor).deliver_later
      MenteeMailer.matched_email(@mentorship.mentee).deliver_later
    end
    redirect_to user_path(@mentorship.mentor)
  end

  def show
    @mentee = Mentee.find(params[:id])
    #render :'/mentors/matches'
  end
end
