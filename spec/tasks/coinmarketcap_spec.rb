require 'rails_helper'

describe 'rake coinmarketcap:request_sender', type: :task do

  it 'preloads the Rails environment' do
    expect(task.prerequisites).to include 'environment'
  end

  it 'creates criptocurrencies' do
    expect(Cryptocurrency.all.length).to eq 0

    VCR.use_cassette('correct_result') do
      task.execute
    end

    expect(Cryptocurrency.all.length).to eq 100
  end

  it 'doesnt remove existing cryptocurrency' do
    @existing_cryptocurrency = FactoryBot.create(:cryptocurrency, symbol: "SNOOP_DOGG_COIN")

    VCR.use_cassette('correct_result') do
      task.execute
    end

    expect(Cryptocurrency.all.length).to eq 101
    expect(Cryptocurrency.where(symbol: "SNOOP_DOGG_COIN").count).to eq 1
  end

  it 'updates existing cryptocurrency' do
    @existing_cryptocurrency = FactoryBot.create(:cryptocurrency, symbol: "BTC", price: "1000000000000")

    VCR.use_cassette('correct_result') do
      task.execute
    end

    expect(Cryptocurrency.all.length).to eq 100
    expect(Cryptocurrency.find_by(symbol: "BTC").price).not_to eq 1000000000000
  end
end
