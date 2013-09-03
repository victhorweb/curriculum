require 'spec_helper'

describe EssaysController do

  let(:valid_attributes) { { "question" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all essays as @essays" do
      essay = Essay.create! valid_attributes
      get :index, {}, valid_session
      assigns(:essays).should eq([essay])
    end
  end

  describe "GET show" do
    it "assigns the requested essay as @essay" do
      essay = Essay.create! valid_attributes
      get :show, {:id => essay.to_param}, valid_session
      assigns(:essay).should eq(essay)
    end
  end

  describe "GET new" do
    it "assigns a new essay as @essay" do
      get :new, {}, valid_session
      assigns(:essay).should be_a_new(Essay)
    end
  end

  describe "GET edit" do
    it "assigns the requested essay as @essay" do
      essay = Essay.create! valid_attributes
      get :edit, {:id => essay.to_param}, valid_session
      assigns(:essay).should eq(essay)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Essay" do
        expect {
          post :create, {:essay => valid_attributes}, valid_session
        }.to change(Essay, :count).by(1)
      end

      it "assigns a newly created essay as @essay" do
        post :create, {:essay => valid_attributes}, valid_session
        assigns(:essay).should be_a(Essay)
        assigns(:essay).should be_persisted
      end

      it "redirects to the created essay" do
        post :create, {:essay => valid_attributes}, valid_session
        response.should redirect_to(Essay.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved essay as @essay" do
        Essay.any_instance.stub(:save).and_return(false)
        post :create, {:essay => { "question" => "invalid value" }}, valid_session
        assigns(:essay).should be_a_new(Essay)
      end

      it "re-renders the 'new' template" do
        Essay.any_instance.stub(:save).and_return(false)
        post :create, {:essay => { "question" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested essay" do
        essay = Essay.create! valid_attributes
        Essay.any_instance.should_receive(:update_attributes).with({ "question" => "MyString" })
        put :update, {:id => essay.to_param, :essay => { "question" => "MyString" }}, valid_session
      end

      it "assigns the requested essay as @essay" do
        essay = Essay.create! valid_attributes
        put :update, {:id => essay.to_param, :essay => valid_attributes}, valid_session
        assigns(:essay).should eq(essay)
      end

      it "redirects to the essay" do
        essay = Essay.create! valid_attributes
        put :update, {:id => essay.to_param, :essay => valid_attributes}, valid_session
        response.should redirect_to(essay)
      end
    end

    describe "with invalid params" do
      it "assigns the essay as @essay" do
        essay = Essay.create! valid_attributes
        Essay.any_instance.stub(:save).and_return(false)
        put :update, {:id => essay.to_param, :essay => { "question" => "invalid value" }}, valid_session
        assigns(:essay).should eq(essay)
      end

      it "re-renders the 'edit' template" do
        essay = Essay.create! valid_attributes
        Essay.any_instance.stub(:save).and_return(false)
        put :update, {:id => essay.to_param, :essay => { "question" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested essay" do
      essay = Essay.create! valid_attributes
      expect {
        delete :destroy, {:id => essay.to_param}, valid_session
      }.to change(Essay, :count).by(-1)
    end

    it "redirects to the essays list" do
      essay = Essay.create! valid_attributes
      delete :destroy, {:id => essay.to_param}, valid_session
      response.should redirect_to(essays_url)
    end
  end

end