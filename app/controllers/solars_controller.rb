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
      result = ((solar_params[:current_price].to_f - 50 * 0.7)*1000) / (30*3.68*0.7*375)
      return result.ceil
    else
      return 5
    end
  end

  def power
    (modules * 375) / 1000.to_f
  end

  def area
    modules * 2
  end

  def estimated_monthly_energy
    (power * 30 * 4.15).round(2)
  end

  def system_price
    power * (7.392 + 12.99 * Math.exp(-0.7655 * power)) * 1000
  end

  def percentage_savings
    (estimated_monthly_energy * state_price / solar_params[:current_price].to_f * 100).ceil
  end

  def value_saving
    (estimated_monthly_energy * state_price)
  end

  def energy_bill_after
    if solar_params[:current_price].to_f - value_saving < state_price * 50
      state_price * 50
    else
      solar_params[:current_price].to_f - value_saving
    end
  end

  def state_price
    state = {
      AC: 0.51,
      AL: 0.51,
      AP: 0.53,
      AM: 0.60,
      BA: 0.51,
      CE: 0.49,
      DF: 0.52,
      ES: 0.48,
      GO: 0.48,
      MA: 0.56,
      MT: 0.56,
      MS: 0.54,
      MG: 0.58,
      PA: 0.59,
      PB: 0.49,
      PR: 0.50,
      PE: 0.52,
      PI: 0.55,
      RJ: 0.59,
      RN: 0.48,
      RS: 0.52,
      RO: 0.49,
      RR: 0.45,
      SC: 0.45,
      SP: 0.45,
      SE: 0.52,
      TO: 0.54,
    }

    state[solar_params[:state].to_sym]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solar
      @solar = Solar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def solar_params
      params.require(:solar).permit(:name, :email, :phone, :state, :place, :current_price, :connection_type)
    end
end
