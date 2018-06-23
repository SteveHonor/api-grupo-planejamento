class SolarsController < ApplicationController
  before_action :set_solar, only: [:show, :update, :destroy]

  # GET /solars
  def index
    @solars = Solar.all

    render json: @solars
  end

  # GET /solars/1
  def show
    render json: @solar
  end

  # POST /solars
  def create
    @solar = Solar.new(solar_params)

    result = {
      modules: modules,
      power: power,
      area: area,
      estimated_monthly_energy: estimated_monthly_energy,
      system_price: system_price,
      percentage_savings: percentage_savings,
      value_saving: value_saving,
      energy_bill_after: energy_bill_after
    }

    if @solar.save
      render json: result, status: :created, location: @solar
    else
      render json: @solar.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /solars/1
  def update
    if @solar.update(solar_params)
      render json: @solar
    else
      render json: @solar.errors, status: :unprocessable_entity
    end
  end

  # DELETE /solars/1
  def destroy
    @solar.destroy
  end

  def modules
    if solar_params[:current_price].to_f > 126.96
      result = ((solar_params[:current_price].to_f - 50 * 0.7)*1000) / (30*3.68*0.7*310)
      return result.ceil
    else
      return 5
    end
  end

  def power
    (modules * 310) / 1000.to_f
  end

  def area
    modules * 2
  end

  def estimated_monthly_energy
    (power * 30 * 3.68).round(2)
  end

  def system_price
    power * (7.392 + 12.99 * Math.exp(-0.7655 * power)) * 1000
  end

  def percentage_savings
    (estimated_monthly_energy * 0.30 / solar_params[:current_price].to_f * 100).ceil
  end

  def value_saving
    (estimated_monthly_energy * 0.30)
  end

  def energy_bill_after
    if solar_params[:current_price].to_f - value_saving < 0.30 * 50
      0.30 * 50
    else
      solar_params[:current_price].to_f - value_saving
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solar
      @solar = Solar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solar_params
      params.require(:solar).permit(:name, :email, :phone, :zip_code, :place, :current_price)
    end
end
