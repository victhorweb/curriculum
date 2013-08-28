class Admin::LevelsController < ApplicationController
  before_filter :logged?

  layout 'application'

  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show
    @level = Level.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @level }
    end
  end

  def new
    @level = Level.new
end

  def edit
    @level = Level.find(params[:id])
  end

  def create
    @level = Level.new(params[:level])
    respond_to do |format|
      if @level.save
        format.html { redirect_to "/admin/levels", notice: 'Nivel Criado COm sucesso' }
     else
        format.html { render action: "new" }
        end
    end
  end

  def update
    @level = Level.find(params[:id])
    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to "/admin/levels", notice: 'NIvel Alterado Com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/levels" }
      format.json { head :no_content }
    end
  end
end