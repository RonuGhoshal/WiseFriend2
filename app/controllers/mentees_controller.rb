class MenteesController < ApplicationController
  def show
      if session[:id] == params[:id].to_i && session[:type] == "mentee"
        @mentee = Mentee.find(params[:id])
      else
        #flash error
      end
  end

  def new
    @mentee = Mentee.new
  end

  def edit
  end

  def create
    @mentee = Mentee.new(mentee_params)
    if @mentee.save
      session[:id] = @mentee.id
      session[:type] = "mentee"
      redirect_to @mentee
    end
  end

  def update
  end

  def destroy
  end

  private
    def mentee_params
      params.require(:mentee).permit(:first_name, :last_name, :location, :age, :gender, :mentor_preferred_gender, :email, :password, :phone, :preferred_communication, :how_did_you_hear, :addl_info, :challenge1, :challenge2, :challenge3)
    end
end
