require 'test_helper'

class UniversitiesControllerTest < ActionController::TestCase
  setup do
    @university = universities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create university" do
    assert_difference('University.count') do
      post :create, university: { address: @university.address, city_id: @university.city_id, district: @university.district, name: @university.name, phone: @university.phone, state_id: @university.state_id, zip_code: @university.zip_code }
    end

    assert_redirected_to university_path(assigns(:university))
  end

  test "should show university" do
    get :show, id: @university
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @university
    assert_response :success
  end

  test "should update university" do
    put :update, id: @university, university: { address: @university.address, city_id: @university.city_id, district: @university.district, name: @university.name, phone: @university.phone, state_id: @university.state_id, zip_code: @university.zip_code }
    assert_redirected_to university_path(assigns(:university))
  end

  test "should destroy university" do
    assert_difference('University.count', -1) do
      delete :destroy, id: @university
    end

    assert_redirected_to universities_path
  end
end
