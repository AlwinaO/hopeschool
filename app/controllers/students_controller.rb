class StudentsController < ApplicationController

  def new
    # check if the student is nested and it has the proper teacher id
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @student = teacher.students.build #has_many
    else
      @student = Student.new
      @student.build_teacher #belongs_to
    end
  end

  def create
    @student = current_teacher.students.build(student_params)
    if @student.save
      redirect_to teacher_student_path(@student)
    else
      @student.build_teacher unless @student.teacher
      render :new
    end
  end

  def index
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @students = teacher.students
    end 

  end

  private
    def student_params
      params.require(:student).permit(:name, :grade, :score, :teacher_id)
    end
end
