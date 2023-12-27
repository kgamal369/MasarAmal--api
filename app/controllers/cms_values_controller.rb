class CmsValuesController < ApplicationController
  before_action :set_cms_value, only: %i[ show edit update destroy ]

  # GET /cms_values or /cms_values.json
  def index
    @cms_values = CmsValue.all
  end

  # GET /cms_values/1 or /cms_values/1.json
  def show
  end

  # GET /cms_values/new
  def new
    @cms_value = CmsValue.new
  end

  # GET /cms_values/1/edit
  def edit
  end

  # POST /cms_values or /cms_values.json
  def create
    @cms_value = CmsValue.new(cms_value_params)

    respond_to do |format|
      if @cms_value.save
        format.html { redirect_to cms_value_url(@cms_value), notice: "Cms value was successfully created." }
        format.json { render :show, status: :created, location: @cms_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cms_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cms_values/1 or /cms_values/1.json
  def update
    respond_to do |format|
      if @cms_value.update(cms_value_params)
        format.html { redirect_to cms_value_url(@cms_value), notice: "Cms value was successfully updated." }
        format.json { render :show, status: :ok, location: @cms_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cms_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms_values/1 or /cms_values/1.json
  def destroy
    @cms_value.destroy!

    respond_to do |format|
      format.html { redirect_to cms_values_url, notice: "Cms value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cms_value
      @cms_value = CmsValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cms_value_params
      params.fetch(:cms_value, {})
    end
end
