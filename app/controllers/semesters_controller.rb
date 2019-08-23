class SemestersController < ApplicationController

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
    @semester = Semester.find_by(id: params[:id])
  end

  def edit
    @semester = Semester.find_by(id: params[:id])
  end

  def update
    @semester = Semester.find_by(id: params[:id])
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
end
