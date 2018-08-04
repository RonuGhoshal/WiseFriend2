class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user.type == "Mentor"
      render 'mentors/show'
    elsif @user.type == "Mentee"
      render 'mentees/show'      
    end
  end

  def new
    @mentor = Mentor.new
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save!
      MentorMailer.welcome_email(@mentor).deliver_later
      session[:id] = @mentor.id
      session[:type] = "mentor"
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
