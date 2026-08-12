require "test_helper"

class EducationalInstitutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @educational_institute = educational_institutes(:one)
  end

  test "should get index" do
    get educational_institutes_url, as: :json
    assert_response :success
  end

  test "should create educational_institute" do
    assert_difference("EducationalInstitute.count") do
      post educational_institutes_url, params: { educational_institute: { cnpj: @educational_institute.cnpj, name: @educational_institute.name, school_type: @educational_institute.school_type } }, as: :json
    end

    assert_response :created
  end

  test "should show educational_institute" do
    get educational_institute_url(@educational_institute), as: :json
    assert_response :success
  end

  test "should update educational_institute" do
    patch educational_institute_url(@educational_institute), params: { educational_institute: { cnpj: @educational_institute.cnpj, name: @educational_institute.name, school_type: @educational_institute.school_type } }, as: :json
    assert_response :success
  end

  test "should destroy educational_institute" do
    assert_difference("EducationalInstitute.count", -1) do
      delete educational_institute_url(@educational_institute), as: :json
    end

    assert_response :no_content
  end
end
