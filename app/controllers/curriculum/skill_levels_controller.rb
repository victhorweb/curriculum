class Curriculum::SkillLevelController < ApplicationController
before_filter :logged?
layout "pub"
 def index
    @skill_level = Vacant.find(params[:id]).sector.skills
     respond_to do |format|
     format.html # index.html.erb
     format.json { render json: @sectors }
    end
  end

 def show
    @skill_level = Skill.find(params[:id])
     respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @skill }
    end
  end

 def new
    @skill_level = SkillLevel.new
    respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @skill }
   end
 end

 def edit
    @skill_level = SkillLevel.find(params[:id])
  end

 def create
    @skill_level = SkillLevel.new(params[:skill_level])
    respond_to do |format|
      if @skill_level.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

 def update
   @skill_level = SkillLevel.find(params[:id])
    respond_to do |format|
      if @skill_level.update_attributes(params[:skill])
        format.html { redirect_to @skill_level, notice: 'Skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill_level.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @skill_level = SkillLevel.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end

  def load_sectors
    @sector = Sector.for_select
  end

  def inscrition
    @skill_levels = SkillLevel.new
    @level = Level.all

  end

end
