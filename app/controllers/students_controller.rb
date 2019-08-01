class StudentsController < ApplicationController

  def new
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @student = teacher.students.build
    else
      @student = Student.new
      @student.build_teacher
    end
  end

  def create

  end

  private
    def student_params
      params.require(:student).permit(:name, :grade, :score, :teacher_id)
    end
end
