class Conversion < ApplicationRecord
  validates :initial_currency, :final_currency, :amount, presence: true

  before_save :calculate_result

  def calculate_result
    @currency1 = Cryptocurrency.find_by(symbol: initial_currency)
    @currency2 = Cryptocurrency.find_by(symbol: final_currency)

    self.result = (@currency1.price * amount) / @currency2.price
  end
end
