class TeacherSemestersController < ApplicationController

  def new
    @teacher_semester = TeacherSemester.new
  end

  def create
    @teacher_semester = TeacherSemester.new
    current_teacher = Teacher.find_by(id: params[:teacher_id])
    binding.pry
    if @teacher_semester.save
      redirect_to teacher_path(current_teacher)
    else
      render :new
    end
  end

  private

    def teacher_semester_params
      params.require(teacher_semester).permit(:teacher_grade, :semester_id)
    end

end
