#encoding: utf-8
class LevelsController < ApplicationController
  before_filter :logged?

  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
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
        format.html { redirect_to @level, notice: 'Nível criado com sucesso.' }
        format.json { render json: @level, status: :created, location: @level }
      else
        format.html { render action: "novo" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        format.html { redirect_to @level, notice: 'Nível Alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "editar" }
        format.json { render json: @level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to levels_url }
      format.json { head :no_content }
    end
  end
end