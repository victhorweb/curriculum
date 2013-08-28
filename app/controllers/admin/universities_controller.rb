class Admin::UniversitiesController < ApplicationController
  before_filter :logged?
  before_filter :load_states,:load_cities, only: [:new,:create,:edit,:update]

  def index
    @universities = University.all
  end

  def show
    @university = University.find(params[:id])
  end


  def new
    @university = University.new
  end

  def edit
    @university = University.find(params[:id])
  end

  def create
    @university = University.new(params[:university])

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'Universidade criada com sucesso.' }
        format.json { render json: @university, status: :created, location: @university }
      else
        format.html { render action: "new" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @university = University.find(params[:id])

    respond_to do |format|
      if @university.update_attributes(params[:university])
        format.html { redirect_to @university, notice: 'Universidade alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @university = University.find(params[:id])
    @university.destroy
  end

  def load_states
    @states = States.for_select
  end

  def load_cities
    @city = City.for_select
  end
end