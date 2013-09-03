require 'spec_helper'

describe Admin::UsersController do

  describe "GET index" do
    it "assigns all users as @users" do
      user = User.first
      get :index,{},{id: user.id}
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user =User.first
      get :show, {:id => user.to_param}, {id: user.id}
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it 'assigns a new object to the person' do
      user = FactoryGirl.create(:user)
      get :new
      assigns(:user).should be_new_record
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.first
      get :edit, {:id => user.to_param},{id: user.id}
      assigns(:user).should eq(user)
    end
  end

  # describe "with invalid params" do
  #     it "assigns a newly created but unsaved user as @user" do
  #       User.any_instance.stub(:save).and_return(false)
  #       post :create, {:user => { "email" => "invalid value" }}, {id: user.id}
  #       assigns(:user).should be_a_new(User)
  #     end

  #     it "re-renders the 'new' template" do
  #       User.any_instance.stub(:save).and_return(false)
  #       post :create, {:user => { "email" => "invalid value" }}, {id: user.id}
  #       response.should render_template("new")
  #     end
  #   end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested user" do
  #       user = User.create! valid_attributes
  #       User.any_instance.should_receive(:update_attributes).with({ "email" => "MyString" })
  #       put :update, {:id => user.to_param, :user => { "email" => "MyString" }}, valid_session
  #     end

  #     it "assigns the requested user as @user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       assigns(:user).should eq(user)
  #     end

  #     it "redirects to the user" do
  #       user = User.create! valid_attributes
  #       put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
  #       response.should redirect_to(user)
  #     end
  #   end

    # describe "with invalid params" do
    #   it "assigns the user as @user" do
    #     user = User.create! {id: user.id}
    #     User.any_instance.stub(:save).and_return(false)
    #     put :update, {:id => user.to_param, :user => { "email" => "invalid value" }}, valid_session
    #     assigns(:user).should eq(user)
    #   end

    #   it "re-renders the 'edit' template" do
    #     user = User.create! {id: user.id}
    #     User.any_instance.stub(:save).and_return(false)
    #     put :update, {:id => user.to_param, :user => { "email" => "invalid value" }}, valid_session
    #     response.should render_template("edit")
    #   end
    # end

  # describe "DELETE destroy" do
  #   it "destroys the requested user" do
  #     user = User.create! {id: user.id}
  #     expect {
  #       delete :destroy, {:id => user.to_param}, {id: user.id}
  #     }.to change(User, :count).by(-1)
  #   end

  #   it "redirects to the users list" do
  #     user = User.create! {id: user.id}
  #     delete :destroy, {:id => user.to_param}, {id: user.id}
  #     response.should redirect_to(users_url)
  #   end
  # end

end