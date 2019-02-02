class Conversion < ApplicationRecord
  belongs_to :initial_currency, class_name: 'Cryptocurrency'
  belongs_to :final_currency, class_name: 'Cryptocurrency'

  validates :initial_currency, :final_currency, :amount, presence: true

  before_save :calculate_result

  def initial_currency_sym=(sym)
    self.initial_currency = Cryptocurrency.find_by(symbol: sym)
  end

  def final_currency_sym=(sym)
    self.final_currency = Cryptocurrency.find_by(symbol: sym)
  end

  def calculate_result
    self.result = (initial_currency.price * amount) / final_currency.price
  end
end
