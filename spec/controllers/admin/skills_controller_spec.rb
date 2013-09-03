require 'spec_helper'

describe Admin::SkillsController do


  describe "GET index" do
    it "assigns all skills as @skills" do
     user = User.first
      skill =  FactoryGirl.create(:skill)
      get :index,{},{id: user.id}
      assigns(:skills).should eq([skill])
    end
  end

  # describe "GET show" do
  #   it "assigns the requested skill as @skill" do
  #     user = User.first
  #     skill = FactoryGirl.create(:skill)
  #     get :show, {skill: skill.to_param}
  #     response.should redirect_to '/login/login'
  #   end
  # end

  describe "GET new" do
    it "assigns a new skill as @skill" do
      user = User.first
      get :new, {}, {id: user.id}
      assigns(:skill).should be_a_new(Skill)
    end
  end

  describe "GET edit" do
    it "assigns the requested skill as @skill" do
      user = User.first
      skill = FactoryGirl.create(:skill)
      get :edit, {:id => skill.to_param}, {id: user.id}
      assigns(:skill).should eq(skill)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Skill" do
        user = User.first
        expect {
          post :create, {:skill => FactoryGirl.attributes_for(:skill)}, {id: user.id}
        }.to change(Skill, :count).by(1)
      end

      it "assigns a newly created skill as @skill" do
        user = User.first
        post :create, {:skill => FactoryGirl.attributes_for(:skill)}, {id: user.id}
        assigns(:skill).should be_a(Skill)
        assigns(:skill).should be_persisted
      end

      it "redirects to the created skill" do
        user = User.first
        post :create, {:skill => FactoryGirl.attributes_for(:skill)}, {id: user.id}
        response.should redirect_to admin_skill_path(Skill.last)
      end
    end


    describe "with invalid params" do
      it "assigns a newly created but unsaved skill as @skill" do
        user = User.first
        Skill.any_instance.stub(:save).and_return(false)
        post :create, {:skill => { "name" => "invalid value" }},  {id: user.id}
        assigns(:skill).should be_a_new(Skill)
      end

      it "re-renders the 'new' template" do
        user = User.first
        Skill.any_instance.stub(:save).and_return(false)
        post :create, {:skill => { "name" => "invalid value" }},  {id: user.id}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested skill" do
        user = User.first
        skill = FactoryGirl.create(:skill)
        Skill.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => skill.to_param, :skill => { "name" => "MyString" }}, {id: user.id}
      end

      it "assigns the requested skill as @skill" do
        user = User.first
        skill = FactoryGirl.create(:skill)
        put :update, {:id => skill.to_param, :skill =>  FactoryGirl.attributes_for(:skill)}, {id: user.id}
        assigns(:skill).should eq(skill)
      end

      it "redirects to the skill" do
        user = User.first
        skill = FactoryGirl.create(:skill)
        put :update, {:id => skill.to_param, :skill =>  FactoryGirl.attributes_for(:skill)}, {id: user.id}
        response.should redirect_to admin_skills_path
      end
    end

    describe "with invalid params" do
      it "assigns the skill as @skill" do
        user = User.first
        skill = FactoryGirl.create(:skill)
        Skill.any_instance.stub(:save).and_return(false)
        put :update, {:id => skill.to_param, :skill => { "name" => "invalid value" }}, {id: user.id}
        assigns(:skill).should eq(skill)
      end

      it "re-renders the 'edit' template" do
        user = User.first
        skill = FactoryGirl.create(:skill)
        Skill.any_instance.stub(:save).and_return(false)
        put :update, {:id => skill.to_param, :skill => { "name" => "invalid value" }}, {id: user.id}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested skill" do
      user = User.first
      skill = FactoryGirl.create(:skill)
      expect {
        delete :destroy, {:id => skill.to_param}, {id: user.id}
      }.to change(Skill, :count).by(-1)
    end

    it "redirects to the skills list" do
      user = User.first
      skill = FactoryGirl.create(:skill)
      delete :destroy, {:id => skill.to_param}, {id: user.id}
      response.should redirect_to admin_skills_path
    end
  end

end