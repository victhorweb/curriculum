class Admin::SectorsController < ApplicationController
  before_filter :logged?

  def index
    @sectors = Sector.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sectors }
    end
  end

  def show
    @sector = Sector.find(params[:id])
  end

  def new
    @sector = Sector.new
  end

  def edit
    @sector = Sector.find(params[:id])
  end

  def create
    @sector = Sector.new(params[:sector])
    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'Setor criado com sucesso' }
        format.json { render json: @sector, status: :created, location: @sector }
      else
        format.html { render action: "new" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sector = Sector.find(params[:id])
    respond_to do |format|
      if @sector.update_attributes(params[:sector])
        format.html { redirect_to @sector, notice: 'Setor Alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "Editar" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url }
      format.json { head :no_content }
    end
  end
end