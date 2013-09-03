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
        format.html { redirect_to '/admin/sectors', notice: 'Setor criado com sucesso' }

      else
        format.html { render action: "new" }

      end
    end
  end

  def update
    @sector = Sector.find(params[:id])
    respond_to do |format|
      if @sector.update_attributes(params[:sector])
        format.html { redirect_to  '/admin/sectors', notice: 'Setor Alterado com sucesso.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/sectors" }
      format.json { head :no_content }
    end
  end
end