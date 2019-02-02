class CryptocurrenciesController < ApplicationController
  def index
    render json: Cryptocurrency.pluck(:symbol)
  end
end
