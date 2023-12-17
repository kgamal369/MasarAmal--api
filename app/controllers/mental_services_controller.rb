class MentalServicesController < ApplicationController
  before_action :set_mental_service, only: %i[ show edit update destroy ]

  # GET /mental_services or /mental_services.json
  def index
    @mental_services = MentalService.all
  end

  # GET /mental_services/1 or /mental_services/1.json
  def show
  end

  # GET /mental_services/new
  def new
    @mental_service = MentalService.new
  end

  # GET /mental_services/1/edit
  def edit
  end

  # POST /mental_services or /mental_services.json
  def create
    @mental_service = MentalService.new(mental_service_params)

    respond_to do |format|
      if @mental_service.save
        format.html { redirect_to mental_service_url(@mental_service), notice: "Mental service was successfully created." }
        format.json { render :show, status: :created, location: @mental_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mental_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mental_services/1 or /mental_services/1.json
  def update
    respond_to do |format|
      if @mental_service.update(mental_service_params)
        format.html { redirect_to mental_service_url(@mental_service), notice: "Mental service was successfully updated." }
        format.json { render :show, status: :ok, location: @mental_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mental_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mental_services/1 or /mental_services/1.json
  def destroy
    @mental_service.destroy!

    respond_to do |format|
      format.html { redirect_to mental_services_url, notice: "Mental service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mental_service
      @mental_service = MentalService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mental_service_params
      params.fetch(:mental_service, {})
    end
end
