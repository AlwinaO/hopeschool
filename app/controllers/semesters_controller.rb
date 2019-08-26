class SemestersController < ApplicationController

  before_action :set_semester, only:[:show, :edit, :update]

  def index
    @semesters = Semester.all
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(semester_params)
    if @semester.save
      redirect_to semesters_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @semester.update(semester_params)
      redirect_to semesters_path
    else
      render :edit
    end
  end

  private

    def semester_params
      params.require(:semester).permit(:quarter, :year)
    end

    def set_semester
      @semester = Semester.find_by(id: params[:id])
    end
end
