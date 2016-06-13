class MentorsController < ApplicationController

  def show
    @mentor = Mentor.find(params[:id])
  end

  def new
    @mentor = Mentor.new
  end

  def edit
  end

  def create
    @mentor = Mentor.new(mentor_params)
    if @mentor.save
      session[:id] = @mentor.id
      session[:type] = "mentor"
      params[:expertise].each do |area|
        @mentor.areas.create(area_type: area)
      end
      redirect_to @mentor
    end
  end

  def update
  end

  def destroy
  end

  private
    def mentor_params
      params.require(:mentor).permit(:first_name, :last_name, :location, :age, :gender, :mentee_preferred_gender, :email, :password, :phone, :linkedin, :preferred_communication, :how_did_you_hear, :addl_info)
    end

end
