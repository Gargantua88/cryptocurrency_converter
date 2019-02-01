class Cryptocurrency < ApplicationRecord
  validates :symbol, :price, presence: true
  validates :symbol, uniqueness: true
end
