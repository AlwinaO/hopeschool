module ApplicationHelper

  def current_teacher
    current_teacher ||= Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
  end

  def logged_in?
    !!current_teacher
  end

  def authenticate_teacher
    if !logged_in?
      redirect_to root_path
    end
  end
end
