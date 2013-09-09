require 'spec_helper'

describe Admin::CoursesController do

  let(:valid_attributes) { { "name" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all courses as @courses" do
      course = Course.create! valid_attributes
      get :index, {}, valid_session
      assigns(:courses).should eq([course])
    end
  end

  describe "GET show" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :show, {:id => course.to_param}, valid_session
      assigns(:course).should eq(course)
    end
  end

  describe "GET new" do
    it "assigns a new course as @course" do
      get :new, {}, valid_session
      assigns(:course).should be_a_new(Course)
    end
  end

  describe "GET edit" do
    it "assigns the requested course as @course" do
      course = Course.create! valid_attributes
      get :edit, {:id => course.to_param}, valid_session
      assigns(:course).should eq(course)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {:course => valid_attributes}, valid_session
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {:course => valid_attributes}, valid_session
        assigns(:course).should be_a(Course)
        assigns(:course).should be_persisted
      end

      it "redirects to the created course" do
        post :create, {:course => valid_attributes}, valid_session
        response.should redirect_to(Course.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        post :create, {:course => { "name" => "invalid value" }}, valid_session
        assigns(:course).should be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        post :create, {:course => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested course" do
        course = Course.create! valid_attributes

        Course.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => course.to_param, :course => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested course as @course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
        assigns(:course).should eq(course)
      end

      it "redirects to the course" do
        course = Course.create! valid_attributes
        put :update, {:id => course.to_param, :course => valid_attributes}, valid_session
        response.should redirect_to(course)
      end
    end

    describe "with invalid params" do
      it "assigns the course as @course" do
        course = Course.create! valid_attributes
        Course.any_instance.stub(:save).and_return(false)
        put :update, {:id => course.to_param, :course => { "name" => "invalid value" }}, valid_session
        assigns(:course).should eq(course)
      end

      it "re-renders the 'edit' template" do
        course = Course.create! valid_attributes
        Course.any_instance.stub(:save).and_return(false)
        put :update, {:id => course.to_param, :course => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested course" do
      course = Course.create! valid_attributes
      expect {
        delete :destroy, {:id => course.to_param}, valid_session
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = Course.create! valid_attributes
      delete :destroy, {:id => course.to_param}, valid_session
      response.should redirect_to(courses_url)
    end
  end

end
