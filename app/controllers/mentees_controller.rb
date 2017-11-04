class MenteesController < ApplicationController
  def show
      if session[:id] == params[:id].to_i && session[:type] == "mentee"
        @mentee = Mentee.find(params[:id])
      else
        if session[:type] == "mentee"
          @mentee = Mentee.find(session[:id])
        elsif session[:type] == "mentor"
           @mentor = Mentor.find(session[:id])
          redirect_to @mentor
        end
      end
  end

  def new
    @mentee = Mentee.new
  end

  def create
    @mentee = Mentee.new(mentee_params)
    if @mentee.save
      MenteeMailer.welcome_email(@mentee).deliver_later
      session[:id] = @mentee.id
      session[:type] = "mentee"
      redirect_to @mentee
    else
      render :'mentees/new'
    end
  end

  private
    def mentee_params
      params.require(:mentee).permit(:first_name, :last_name, :location, :age, :gender, :mentor_preferred_gender, :email, :password, :phone, :preferred_communication, :how_did_you_hear, :addl_info, :challenge1, :challenge2, :challenge3)
    end
end
