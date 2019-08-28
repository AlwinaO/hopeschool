class TeachersController < ApplicationController
  before_action :require_login, only:[:show, :edit, :update]
  before_action :set_teacher, only:[:show, :edit, :update]
  before_action only:[:edit, :update] do
                redirect_if_not_authorized_to_edit_teacher(@teacher)
              end

  # renders the form for a new teacher
  def new
    @teacher = Teacher.new
    @teacher.build_classroom
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = "Your profile has been successfully created."
      session[:teacher_id] = @teacher.id
      redirect_to teacher_path(@teacher)
    else
      flash.now[:error] = "Your profile was not created. Please try again."
      render :new
    end
  end

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def edit
    @classroom = @teacher.build_classroom
  end

  def update
# binding.pry
    if @teacher.update_attributes(teacher_params)
      flash[:notice] = "Your profile has been successfully updated."
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :subject, classroom_attributes: [:id, :name, :location])
  end

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
  end
end
