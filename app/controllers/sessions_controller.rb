class SessionsController < ApplicationController

  def create
    if params[:user_type] == "mentee"
      @mentee = Mentee.find_by(email: params[:email])
      if mentee && mentee.authenticate(params[:password])
        session[:id] = @mentee.id
        session[:type] = "mentee"
      else

      end
    elsif params[:user_type] == "mentor"
      @mentor = Mentor.find_by(email: params[:email])
      if mentor && mentor.authenticate(params[:password])
        session[:id] = @mentor.id
        session[:type] = "mentor"
      else

      end
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
