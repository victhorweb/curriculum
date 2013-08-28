class Admin::VacantsController < ApplicationController
  before_filter :logged?
  before_filter :load_sectors, only: [:new,:create,:edit,:update]

 layout 'application'

  def index
    @vacants = Vacant.all
  end

 def vacants_avaliable
    @vacants = Vacant.all
end

 def show
    @vacant = Vacant.find(params[:id])
 end

 def new
    @vacant = Vacant.new
 end

  def edit
    @vacant = Vacant.find(params[:id])
  end

  def create
    @vacant = Vacant.new(params[:vacant])

    respond_to do |format|
      if @vacant.save
        format.html { redirect_to '/admin/vacants', notice: 'Vacant was successfully created.' }
        format.json { render json: @vacant, status: :created, location: @vacant }
      else
        format.html { render action: "new" }
        format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @vacant = Vacant.find(params[:id])

    respond_to do |format|
      if @vacant.update_attributes(params[:vacant])
        format.html { redirect_to @vacant, notice: 'Vacant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
  @vacant = Vacant.find(params[:id])
  @vacant.destroy

   respond_to do |format|
     format.html { redirect_to "/admin/vacants" }
     format.json { head :no_content }
    end
  end

  def load_sectors
    @sector = Sector.for_select
  end

 def filled
    @vacants = Vacant.all
    @inscritions = Inscrition
    @people = Person.all
    @status = Status.all
    @sectors = Sector.all
    @vacants = Vacant.all
 end

 def filled_filter
  @vacants = Vacant.all
  @sectors = Sector.all
  @status = Status.all
   @inscritions = Inscrition.search(params)

 end
end