class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
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

  def show
    @teacher = Teacher.find_by(id: params[:id])

  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :subject)

  end
end
