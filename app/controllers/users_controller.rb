class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(type: params[:type])
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save!
      MentorMailer.welcome_email(@mentor).deliver_later
      if params[:expertise]
        params[:expertise].each do |area|
          @mentor.areas.create(area_type: area)
        end
      end
      redirect_to @mentor
    else
      render '/mentors/new'
    end
  end

  private
    def mentor_params
      params.require(:mentor).permit(:first_name, :last_name, :location, :age, :gender, :mentee_preferred_gender, :email, :password, :phone, :linkedin, :preferred_communication, :how_did_you_hear, :addl_info)
    end

end
