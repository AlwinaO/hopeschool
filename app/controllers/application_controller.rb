class ApplicationController < ActionController::Base

    def current_teacher
      @current_teacher ||= Teacher.find_by(id: session[:teacher_id]) if session[:teacher_id]
    end

    def logged_in?
      !!current_teacher
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section."
        redirect_to root_path
      end
    end

    def authorized_to_edit?(student)
      student.teacher == current_teacher
    end

    def redirect_if_not_authorized_to_edit(student)
      if !authorized_to_edit?(student)
        flash[:error] = "You must be the teacher to edit this student."
        redirect_to teacher_path(current_teacher)
      end
    end
end
