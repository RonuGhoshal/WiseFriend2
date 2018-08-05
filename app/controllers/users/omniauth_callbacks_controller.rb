class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    binding.pry
    #
    # This method will find or create the user.
    #
    # The model checks that the email address ends in pivotbio.com and will not
    # save the user otherwise.
    #
    @user = User.from_omniauth(request.env['omniauth.auth'])

    # the user model checks to make sure that the email address ends in
    # pivotbio.com but this additional check lets me specify an error message
    #
    # log this stuff so we can track failed logins
    #
    if !(@user.email =~ User::EMAIL_VALIDATION_REGEX)
      flash[:error] = 'Please use your Pivot Bio account!'
      logger.info "failed sign-in from email=#{@user.email} ip=#{request.remote_ip}"
      redirect_to root_url
    elsif @user.persisted?
      flash[:notice] = "Hello #{@user.username}!"
      logger.info "successful sign-in from email=#{@user.email} ip=#{request.remote_ip}"
      sign_in_and_redirect @user, event: :authentication
    else
      logger.warn "failed sign-in from email=#{@user.email} ip=#{request.remote_ip}"
      flash[:error] = 'Something went wrong'
      redirect_to root_url
    end
  end
end
