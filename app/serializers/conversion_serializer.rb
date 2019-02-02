class ConversionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :created_at

  belongs_to :initial_currency
  belongs_to :final_currency
end
