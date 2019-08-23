class SessionsController < ApplicationController

  def welcome

  end

  # renders the login page, which is a form_tag
  def new

  end

  # login the teacher if already signed up
  def create
    if @teacher = Teacher.find_by(email: params[:teacher][:email])
      @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def omniauth
    if params[:provider] == 'google_oauth2'
      @teacher = Teacher.create_with_google_omniauth(auth)
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      params[:provider] == 'facebook'
      @teacher = Teacher.create_with_facebook_omniauth(auth)
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    end
  end

  # log out the teacher and redirect_to the home page
  def destroy
    session.delete(:teacher_id)
    current_teacher = nil
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end
end
