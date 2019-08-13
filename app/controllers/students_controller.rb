class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    # check if the student is nested and it has the proper teacher id
    # binding.pry
    # when adding the classroom_id no need to build the form for the classroom; just whitelist the :classroom_id in the strong params
    @teacher = Teacher.find_by_id(params[:teacher_id])
    if (params[:teacher_id] && @teacher)
      @student = @teacher.students.build
    else
      @student = Student.new
      @student.build_teacher #belongs_to
    end
  end

  def create

    @student = current_teacher.students.build(student_params)
    if @student.save
      # binding.pry
      redirect_to student_path(@student)
    else
      @student.build_teacher unless @student.teacher
      render :new
    end
  end


  def show
    @student = Student.find(params[:id])
  end

  # create a private method to set the student by finding the current_teacher and student for the edit, update, and destroy methods
  def edit
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = Student.find_by_id(params[:id])
    # binding.pry
  end

  def update
    current_teacher = Teacher.find_by_id(params[:teacher_id])
    @student = Student.find_by_id(params[:id])
    # binding.pry
    if @student.update(student_params)
      redirect_to student_path(@student)
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
