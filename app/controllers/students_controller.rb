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
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = current_teacher.students.build(student_params)
    if @student.save
      redirect_to teacher_student_path(current_teacher, @student)
    else
      @student.build_teacher unless @student.teacher
      render :new
    end
  end

  def index
    @students = Student.all

  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  # create a private method to set the student by finding the current_teacher and student for the edit, update,  and destroy methods
  def edit
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = Student.find_by_id(params[:id])
  end

  def update
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = Student.find_by_id(params[:id])
    if @student.update(student_params)
      redirect_to teacher_student_path(current_teacher, @student)
    else
      render :edit
    end
  end

  def destroy
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = Student.find_by_id(params[:id])
    @student.destroy
    redirect_to teacher_students_path
  end

  private
    def student_params
      params.require(:student).permit(:name, :grade, :score, :teacher_id, :classroom_id)
    end
end
