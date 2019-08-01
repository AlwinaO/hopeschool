class SessionsController < ApplicationController

  def welcome

  end

  def new

  end

  def create

    @teacher = Teacher.find_by(email: params[:teacher][:email])

    if @teacher && @teacher.authenticate(params[:password])
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      #add flash message for incorrect login info
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
