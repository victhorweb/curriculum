class Admin::SkillsController < ApplicationController
   before_filter :logged?
   before_filter :load_sectors, only: [:new,:create,:edit,:update]

  layout 'application'
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def new
    @skill = Skill.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to "/admin/skills/#{@skill.id}", notice: 'Habilidade criada cpom sucesso.' }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to "/admin/skills", notice: 'Habilidade alterada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to "/admin/skills" }
      format.json { head :no_content }
    end
  end

  def load_sectors
    @sector = Sector.for_select
  end

  def list_skills
    @skill = Skill.all
  end

end