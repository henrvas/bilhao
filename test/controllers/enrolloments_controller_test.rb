require "test_helper"

class EnrollomentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enrolloment = enrolloments(:one)
  end

  test "should get index" do
    get enrolloments_url, as: :json
    assert_response :success
  end

  test "should create enrolloment" do
    assert_difference("Enrolloment.count") do
      post enrolloments_url, params: { enrolloment: { full_price_course: @enrolloment.full_price_course, invoice_due_date: @enrolloment.invoice_due_date, name_course: @enrolloment.name_course, number_invoices: @enrolloment.number_invoices } }, as: :json
    end

    assert_response :created
  end

  test "should show enrolloment" do
    get enrolloment_url(@enrolloment), as: :json
    assert_response :success
  end

  test "should update enrolloment" do
    patch enrolloment_url(@enrolloment), params: { enrolloment: { full_price_course: @enrolloment.full_price_course, invoice_due_date: @enrolloment.invoice_due_date, name_course: @enrolloment.name_course, number_invoices: @enrolloment.number_invoices } }, as: :json
    assert_response :success
  end

  test "should destroy enrolloment" do
    assert_difference("Enrolloment.count", -1) do
      delete enrolloment_url(@enrolloment), as: :json
    end

    assert_response :no_content
  end
end
