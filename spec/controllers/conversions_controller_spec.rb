require 'rails_helper'

RSpec.describe ConversionsController, type: :controller do
  describe '#create' do
    before do
      @params = {
          initial_currency: 'ETH',
          final_currency: 'BTC',
          amount: '1'
      }
    end

    let!(:btc) { FactoryBot.create(:cryptocurrency, symbol: "BTC", price: "200") }
    let!(:eth) { FactoryBot.create(:cryptocurrency, symbol: "ETH", price: "100") }

    it 'creates conversion by params' do
      post :create, params: {conversion: @params}

      expect(Conversion.where(@params).count).to eq 1
    end

    it 'adds correct result' do
      post :create, params: {conversion: @params}

      expect(Conversion.last.result).to eq 0.5
    end
  end
end
