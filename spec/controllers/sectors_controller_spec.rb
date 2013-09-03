require 'spec_helper'

describe Admin::SectorsController do

  describe "GET index" do
    it "assigns all sectors as @sectors" do
      user = User.first
      sector = FactoryGirl.create(:sector)
      get :index, {}, {id: user.id}
      assigns(:sectors).should eq([sector])
    end
  end

  describe "GET show" do
     it "assigns the requested sector as @sector" do
       user = User.first
       sector = FactoryGirl.create(:sector)
       get :show, {:id => sector.to_param}, {id: user.id}
       assigns(:sector).should eq(sector)
     end
   end

  describe "GET new" do
    it "assigns a new sector as @sector" do
      user = User.first
      get :new, {}, {id: user.id}
      assigns(:sector).should be_a_new(Sector)
    end
  end

  describe "GET edit" do
    it "assigns the requested sector as @sector" do
      user = User.first
      sector = FactoryGirl.create(:sector)
      get :edit, {:id => sector.to_param}, {id: user.id}
      assigns(:sector).should eq(sector)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sector" do
        user = User.first
        p FactoryGirl.attributes_for(:sector)
        expect {
          post :create, {sector:  FactoryGirl.attributes_for(:sector)}, {id: user.id}
        }.to change(Sector, :count).by(1)
      end

      it "assigns a newly created sector as @sector" do
        user = User.first
        post :create, {:sector =>  FactoryGirl.attributes_for(:sector)}, {id: user.id}
        assigns(:sector).should be_a(Sector)
        assigns(:sector).should be_persisted
      end

      it "redirects to the created sector" do
        user = User.first
        post :create, {:sector =>  FactoryGirl.attributes_for(:sector)}, {id: user.id}
        response.should redirect_to admin_sectors_path
      end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sector as @sector" do
        user = User.first
        Sector.any_instance.stub(:save).and_return(false)
        post :create, {:sector => { "name" => "invalid value" }}, {id: user.id}
        assigns(:sector).should be_a_new(Sector)
      end

      it "re-renders the 'new' template" do
        user = User.first
        Sector.any_instance.stub(:save).and_return(false)
        post :create, {:sector => { "name" => "invalid value" }}, {id: user.id}
        response.should render_template("new")
      end
     end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sector" do
        user = User.first
        sector = FactoryGirl.create(:sector)
        Sector.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => sector.to_param, :sector => { "name" => "MyString" }}, {id: user.id}
      end

      it "assigns the requested sector as @sector" do
        user = User.first
        sector = FactoryGirl.create(:sector)
        put :update, {:id => sector.to_param, :sector => FactoryGirl.attributes_for(:sector)}, {id: user.id}
        assigns(:sector).should eq(sector)
      end

      it "redirects to the sector" do
        user = User.first
        sector = FactoryGirl.create(:sector)
        put :update, {:id => sector.to_param, :sector => FactoryGirl.attributes_for(:sector)}, {id: user.id}
        response.should redirect_to admin_sectors_path
      end
    end

    describe "with invalid params" do
      it "assigns the sector as @sector" do
        user = User.first
        sector = FactoryGirl.create(:sector)
        Sector.any_instance.stub(:save).and_return(false)
        put :update, {:id => sector.to_param, :sector => { "name" => "invalid value" }}, {id: user.id}
        assigns(:sector).should eq(sector)
      end

      it "re-renders the 'edit' template" do
        user = User.first
        sector = FactoryGirl.create(:sector)
        Sector.any_instance.stub(:save).and_return(false)
        put :update, {:id => sector.to_param, :sector => { "name" => "invalid value" }}, {id: user.id}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sector" do
      user = User.first
      sector = FactoryGirl.create(:sector)
      expect {
        delete :destroy, {:id => sector.to_param}, {id: user.id}
      }.to change(Sector, :count).by(-1)
    end

    it "redirects to the sectors list" do
      user = User.first
      sector = FactoryGirl.create(:sector)
      delete :destroy, {:id => sector.to_param}, {id: user.id}
      response.should redirect_to "/admin/sectors"
    end
  end

end
