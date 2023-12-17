class TreatmentApproachesController < ApplicationController
  before_action :set_treatment_approach, only: %i[ show edit update destroy ]

  # GET /treatment_approaches or /treatment_approaches.json
  def index
    @treatment_approaches = TreatmentApproach.all
  end

  # GET /treatment_approaches/1 or /treatment_approaches/1.json
  def show
  end

  # GET /treatment_approaches/new
  def new
    @treatment_approach = TreatmentApproach.new
  end

  # GET /treatment_approaches/1/edit
  def edit
  end

  # POST /treatment_approaches or /treatment_approaches.json
  def create
    @treatment_approach = TreatmentApproach.new(treatment_approach_params)

    respond_to do |format|
      if @treatment_approach.save
        format.html { redirect_to treatment_approach_url(@treatment_approach), notice: "Treatment approach was successfully created." }
        format.json { render :show, status: :created, location: @treatment_approach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @treatment_approach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatment_approaches/1 or /treatment_approaches/1.json
  def update
    respond_to do |format|
      if @treatment_approach.update(treatment_approach_params)
        format.html { redirect_to treatment_approach_url(@treatment_approach), notice: "Treatment approach was successfully updated." }
        format.json { render :show, status: :ok, location: @treatment_approach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @treatment_approach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatment_approaches/1 or /treatment_approaches/1.json
  def destroy
    @treatment_approach.destroy!

    respond_to do |format|
      format.html { redirect_to treatment_approaches_url, notice: "Treatment approach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treatment_approach
      @treatment_approach = TreatmentApproach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def treatment_approach_params
      params.fetch(:treatment_approach, {})
    end
end
