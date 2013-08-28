class Admin::CoursesController < ApplicationController
  layout 'application'
  before_filter :logged?

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
 end

 def new
    @course = Course.new
end

 def edit
    @course = Course.find(params[:id])
  end

 def create
    @course = Course.new(params[:course])
    respond_to do |format|
      if @course.save
        format.html { redirect_to '/admin/courses', notice: 'Curso salvado com sucesso.'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
    if @course.update_attributes(params[:course])
     format.html { redirect_to '/admin/courses', notice: 'Curso salvado com sucesso.'}
      else
     format.html { render action: "new" }
    end
  end
end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to '/admin/courses'
  end
end