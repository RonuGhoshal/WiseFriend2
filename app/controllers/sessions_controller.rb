class SessionsController < ApplicationController

  def create
    if params[:user_type] == "mentee"
      @mentee = Mentee.find_by(email: params[:email])
      if @mentee && @mentee.authenticate(params[:password])
        session[:id] = @mentee.id
        session[:type] = "mentee"
        redirect_to @mentee
      else

      end
    elsif params[:user_type] == "mentor"
      @mentor = Mentor.find_by(email: params[:email])
      if @mentor && @mentor.authenticate(params[:password])
        session[:id] = @mentor.id
        session[:type] = "mentor"
        redirect_to @mentor
      else
        p "stuff"
      end

    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
