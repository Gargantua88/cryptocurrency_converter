class CryptocurrencySerializer < ActiveModel::Serializer
  attributes :symbol, :price
end
