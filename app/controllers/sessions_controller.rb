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
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      #add flash message for incorrect login info
      render :new
    end
  end

  # log out the teacher and redirect_to the home page
  def destroy
    session.delete(:teacher_id)
    current_teacher = nil
    redirect_to root_path
  end

end
