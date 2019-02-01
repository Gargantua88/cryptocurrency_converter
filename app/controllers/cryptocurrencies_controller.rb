class CryptocurrenciesController < ApplicationController

  def index
    @cryptocurrencies = Cryptocurrency.all
    @symbols = @cryptocurrencies.map do |currency|
                 currency.symbol
               end

    render json: @symbols
  end
end
