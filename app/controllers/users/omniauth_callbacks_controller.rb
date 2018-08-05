class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    #
    # This method will find or create the user.
    #
    # The model checks that the email address ends in pivotbio.com and will not
    # save the user otherwise.
    #
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = "Hello #{@user.first_name}!"
      logger.info "successful sign-in from email=#{@user.email} ip=#{request.remote_ip}"
      sign_in @user, event: :authentication
      redirect_to @user
    else
      logger.warn "failed sign-in from email=#{@user.email} ip=#{request.remote_ip}"
      flash[:error] = 'Something went wrong'
      redirect_to root_url
    end
  end
end
