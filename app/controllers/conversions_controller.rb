class ConversionsController < ApplicationController
  def index
    if params[:last].present?
      @conversions = Conversion.last(params[:last])
    else
      @conversions = Conversion.last(10)
    end

    render json: @conversions
  end

  def create
    @conversion = Conversion.new(conversion_params)

    if @conversion.save
      render json: @conversion, status: :created
    else
      render json: @conversion.errors, status: :unprocessable_entity
    end
  end

  private

  def conversion_params
    params.fetch(:conversion, {}).permit(:initial_currency_sym, :final_currency_sym, :amount)
  end
end
