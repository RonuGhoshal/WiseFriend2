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

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      if @user.type == "Mentor"
        if params[:expertise]
          params[:expertise].each do |area|
            @user.areas.find_or_create_by(area_type: area)
          end
        end
      end
      redirect_to "/users/#{@user.id}"
    else
      format.html { render :edit }
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :location, :age, :gender, :email, :password, :phone, :linkedin, :preferred_communication, :how_did_you_hear, :addl_info, :challenge1, :challenge2, :challenge3, expertise: [])
    end

end
