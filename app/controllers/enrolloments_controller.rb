class EnrollomentsController < ApplicationController
  before_action :set_enrolloment, only: %i[ show update destroy ]

  # GET /enrolloments
  def index
    @enrolloments = Enrolloment.all

    render json: @enrolloments
  end

  # GET /enrolloments/1
  def show
    render json: @enrolloment
  end

  # POST /enrolloments
  def create
    @enrolloment = Enrolloment.new(enrolloment_params)

    if @enrolloment.save
      render json: @enrolloment, status: :created, location: @enrolloment
    else
      render json: @enrolloment.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /enrolloments/1
  def update
    if @enrolloment.update(enrolloment_params)
      render json: @enrolloment
    else
      render json: @enrolloment.errors, status: :unprocessable_content
    end
  end

  # DELETE /enrolloments/1
  def destroy
    @enrolloment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolloment
      @enrolloment = Enrolloment.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def enrolloment_params
      params.expect(enrolloment: [ :full_price_course, :number_invoices, :invoice_due_date, :name_course, :student_id, :educational_institute_id ])
    end
end
