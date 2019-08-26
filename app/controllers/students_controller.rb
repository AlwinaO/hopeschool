class StudentsController < ApplicationController

  before_action :set_teacher, only:[:new, :edit, :update, :destroy]
  before_action :set_student, only:[:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def new
    # check if the student is nested and it has the proper teacher id
    # binding.pry
    # when adding the classroom_id no need to build the form for the classroom; just whitelist the :classroom_id in the strong params
    if (params[:teacher_id] && @teacher)
      @student = current_teacher.students.build
    else
      @student = Student.new
      @student.build_teacher #belongs_to
    end
  end

  def create

    @student = current_teacher.students.build(student_params)
    if @student.save
      flash[:notice] = "Student profile has been successfully created."
      redirect_to student_path(@student)
    else
      @student.build_teacher unless @student.teacher
      render :new
    end
  end

  def show
  end

  def edit
    redirect_if_not_authorized_to_edit(@student)
  end

  def update
    redirect_if_not_authorized_to_edit(@student)
    if @student.update(student_params)
      flash[:notice] = "Student profile has been successfully updated."
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    redirect_if_not_authorized_to_edit(@student)
    @student.destroy
    redirect_to teacher_students_path
  end

  private
    def student_params
      params.require(:student).permit(:name, :grade, :score, :teacher_id, :classroom_id)
    end

    # create a private methods to set the student by finding the current_teacher and student for the edit, update, and destroy methods
    def set_teacher
      current_teacher = Teacher.find_by_id(params[:teacher_id])
      redirect_to root_path if !current_teacher
    end

    def set_student
      @student = Student.find_by_id(params[:id])
      redirect_to teacher_path(current_teacher) if !@student
    end
end
