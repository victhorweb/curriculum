class PeopleController < ApplicationController
   before_filter :load_states,:load_cities,:load_university,:load_course,:load_sectors, only: [:new,:create,:edit,:update]
   layout 'pub'

  def index
    @people = Person.all
  end

 def indexpub
    @person = Person.find(session[:id])
 end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def load_states
    @states = States.for_select
  end

  def load_cities
    @city = City.for_select
  end

  def load_university
    @university = University.for_select
  end

  def load_course
    @course = Course.for_select
  end

  def load_sectors
    @sector = Sector.for_select
  end

end
