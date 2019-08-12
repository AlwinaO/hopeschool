class TeachersController < ApplicationController

  # renders the form for a new teacher
  def new
    @teacher = Teacher.new
    @teacher.build_classroom
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end

  def edit
    @teacher = Teacher.find_by(id: params[:id])
    @classroom = @teacher.build_classroom
  end

  def update
    @teacher = Teacher.find_by(id: params[:id])
# binding.pry
    if @teacher.update(teacher_params)
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :subject,  classroom_attributes: [:name, :location])

  end
end
