class VacantsController < ApplicationController
  def index
    @vacants = Vacant.all
  end

 def vacants_avaliable
    @vacants = Person.find(session[:id]).sector.vacants
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
        format.html { redirect_to @vacant, notice: 'Vaga criada com sucesso' }
        format.json { render json: @vacant, status: :created, location: @vacant }
      else
         format.json { render json: @vacant.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
    @vacant = Vacant.find(params[:id])

    respond_to do |format|
      if @vacant.update_attributes(params[:vacant])
        format.html { redirect_to @vacant, notice: 'Vaga alterada com sucesso.' }
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
  end

  def load_sectors
    @sector = Sector.for_select
  end

end