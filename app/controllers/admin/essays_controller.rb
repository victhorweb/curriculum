class Admin::EssaysController < ApplicationController
  before_filter :logged?
    before_filter :load_skills, only: [:new,:create,:edit,:update]
    before_filter :load_levels, only: [:new,:create,:edit,:update]

   layout 'application'

  def index
    @essays = Essay.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @essays }
    end
  end

  def show
    @essay = Essay.find(params[:id])
  end

  def load_skills
    @skills = Skill.for_select
  end

  def load_levels
    @levels = Level.for_select
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
        format.html { redirect_to "/admin/essays", notice: 'Essay was successfully created.' }
        format.json { render json: @essay, status: :created, location: @essay }
      else
        format.html { render action: "new" }
        format.json { render json: @essay.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @essay = Essay.find(params[:id])

    respond_to do |format|
      if @essay.update_attributes(params[:essay])
        format.html { redirect_to "/admin/essays", notice: 'Essay was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @essay = Essay.find(params[:id])
    @essay.destroy
    respond_to do |format|
      format.html { redirect_to "/admin/essays/" }
      format.json { head :no_content }
    end
  end
end
