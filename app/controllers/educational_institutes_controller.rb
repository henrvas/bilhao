class EducationalInstitutesController < ApplicationController
  before_action :set_educational_institute, only: %i[ show update destroy ]

  # GET /educational_institutes
  def index
    @educational_institutes = EducationalInstitute.all

    render json: @educational_institutes
  end

  # GET /educational_institutes/1
  def show
    render json: @educational_institute
  end

  # POST /educational_institutes
  def create
    @educational_institute = EducationalInstitute.new(educational_institute_params)

    if @educational_institute.save
      render json: @educational_institute, status: :created, location: @educational_institute
    else
      render json: @educational_institute.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /educational_institutes/1
  def update
    if @educational_institute.update(educational_institute_params)
      render json: @educational_institute
    else
      render json: @educational_institute.errors, status: :unprocessable_content
    end
  end

  # DELETE /educational_institutes/1
  def destroy
    @educational_institute.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_educational_institute
      @educational_institute = EducationalInstitute.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def educational_institute_params
      params.expect(educational_institute: [ :name, :cnpj, :school_type ])
    end
end
