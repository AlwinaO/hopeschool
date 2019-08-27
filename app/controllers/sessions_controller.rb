class SessionsController < ApplicationController

  def welcome

  end

  # renders the login page, which is a form_tag
  def new

  end

  # login the teacher if already signed up
  def create
    @teacher = Teacher.find_by(email: params[:teacher][:email])
    if @teacher && @teacher.authenticate(params[:password])
      set_session_and_redirect
    else
      flash.now[:error] = "You were not logged in. Please try again."
      render :new
    end
  end

  # login with Google or Facebook OAuth
  def omniauth
    if params[:provider] == 'google_oauth2'
      @teacher = Teacher.create_with_google_omniauth(auth)
      set_session_and_redirect
    else
      params[:provider] == 'facebook'
      @teacher = Teacher.create_with_facebook_omniauth(auth)
      set_session_and_redirect
    end
  end

  # log out the teacher and redirect_to the home page
  def destroy
    session.delete(:teacher_id)
    current_teacher = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

  private

  # sets the request hash for the omniauth values received
    def auth
      request.env['omniauth.auth']
    end

    def set_session_and_redirect
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    end
end
