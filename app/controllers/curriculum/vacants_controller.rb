class Curriculum::VacantsController < ApplicationController
  before_filter :logged?
  before_filter :load_sectors, only: [:new,:create,:edit,:update]
  # GET /vacants
  # GET /vacants.json
  layout 'pub'

  def teste
  end

  def index
    @vacants = Vacant.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacants }
    end
  end

 def vacants_avaliable
    @vacants = Person.find(session[:id]).sector.vacants
      respond_to do |format|
      format.html
    end
  end

  # GET /vacants/1
  # GET /vacants/1.json
  def show
    @vacant = Vacant.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /vacants/new
  # GET /vacants/new.json
  def new
    @vacant = Vacant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacant }
    end
  end

  # GET /vacants/1/edit
  def edit
    @vacant = Vacant.find(params[:id])
  end

  # POST /vacants
  # POST /vacants.json
  def create
    @vacant = Vacant.new(params[:vacant])

    respond_to do |format|
      if @vacant.save
        format.html { redirect_to @vacant, notice: 'Vacant was successfully created.' }
        format.json { render json: @vacant, status: :created, location: @vacant }
      else
        format.html { render action: "new" }
        format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacants/1
  # PUT /vacants/1.json
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

  # DELETE /vacants/1
  # DELETE /vacants/1.json
  def destroy
    @vacant = Vacant.find(params[:id])
    @vacant.destroy

    respond_to do |format|
      format.html { redirect_to vacants_url }
      format.json { head :no_content }
    end
  end

  def load_sectors
    @sector = Sector.for_select
  end
end
