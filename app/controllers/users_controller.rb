class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(type: params[:type])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      if @user.type == "Mentor"
        MentorMailer.welcome_email(@user).deliver_later
      end
      if params[:expertise]
        params[:expertise].each do |area|
          @user.areas.create(area_type: area)
        end
      end
      redirect_to @user
    else
      render '/mentors/new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :location, :age, :gender, :mentee_preferred_gender, :email, :password, :phone, :linkedin, :preferred_communication, :how_did_you_hear, :addl_info)
    end

end
