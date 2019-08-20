class TeacherSemestersController < ApplicationController

  def new
    current_teacher = Teacher.find_by(id: params[:teacher_id])
    if (params[:teacher_id] && current_teacher)
      @teacher_semester = current_teacher.teacher_semesters.build
    else
      @teacher_semester = TeacherSemester.new
      @teacher_semester.build_teacher
    end

  end

  def create
    @teacher_semester = current_teacher.teacher_semesters.build(teacher_semester_params)
    # binding.pry
    if @teacher_semester.save
      redirect_to teacher_path(current_teacher)
    else
      render :new
    end
  end

  private

    def teacher_semester_params
      params.require(:teacher_semester).permit(:teacher_grade, :teacher_id, :semester_id)
    end

end
