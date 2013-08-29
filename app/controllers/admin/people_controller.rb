class Admin::PeopleController < ApplicationController
   before_filter :load_states,:load_cities,:load_university,:load_course,:load_sectors, only: [:new,:create,:edit,:update]
   before_filter :logged?
   layout 'application'

  def avaliable
    params[:skills].each do |question, number|
      number.each do |valid|
      @correction = Correction.where(person_question_id: question).first
      @correction.update_attributes(person_question_id: question, number: valid[0].to_i, validing:  valid[1].to_s)
    end
   end
    redirect_to "/admin/vacants/filled"
  end


  def index
    @people = Person.all
  end

 def indexpub
    @person = Person.find(session[:id])
  end

  def show
    @person = Person.find(params[:id])
    @person_inscritions = Inscrition.where(person_id: @person.id).all
    @person_avaliable = Avaliable.where(person_id: @person.id).all
    @person_questions = PersonQuestion.where(person_id: @person.id).all
    @person_correction = Person.find(params[:id]).corrections
    @status = Status.all
  end

  def status
  @status =  params[:status].split("|")
  @status[0]
  @status[1]
  @status[2]
  @person= Inscrition.where(person_id: @status[1], vacant_id: @status[2]).first
  @person
   if @person.update_attributes(status_id: @status[0])
      p "ok"
    else
      p "fail"
    end
     redirect_to "/admin/people/#{@status[1]}"
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
     p @person = Person.new(params[:person])
     respond_to do |format|
      if @person.save
        format.html { redirect_to "admin/people", notice: 'Curriculum cadastrado com sucesso' }
      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    p @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to "/admin/people", notice: 'Curriculum alterado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy

    @person = Person.find(params[:id])
    @person.destroy
    redirect_to "/admin/people"
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