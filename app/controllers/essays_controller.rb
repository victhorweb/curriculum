class EssaysController < ApplicationController
  before_filter :logged?

  def index
    @essays = Essay.all
  end

  def show
    @essay = Essay.find(params[:id])
  end

  def new
    @essay = Essay.new
  end

  def edit
    @essay = Essay.find(params[:id])
  end

  def create
    @essay = Essay.new(params[:essay])

    respond_to do |format|
      if @essay.save
        format.html { redirect_to @essay, notice: 'Questão criada com sucesso.' }
        format.json { render json: @essay, status: :created, location: @essay }
      else
        format.html { render action: "Novo" }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @essay = Essay.find(params[:id])

    respond_to do |format|
      if @essay.update_attributes(params[:essay])
        format.html { redirect_to @essay, notice: 'Questão alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "editar" }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @essay = Essay.find(params[:id])
    @essay.destroy

    respond_to do |format|
      format.html { redirect_to essays_url }
      format.json { head :no_content }
    end
  end
end