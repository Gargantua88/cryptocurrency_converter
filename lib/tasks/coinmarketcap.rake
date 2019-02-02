require "net/http"
require "uri"
require "json"
require "dotenv/load"

namespace :coinmarketcap do
  desc "coinmarketcap request sender"
  task request_sender: :environment do
    url = URI.parse('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    req = Net::HTTP::Get.new(url.request_uri)
    req["X-CMC_PRO_API_KEY"] = ENV["API_TOKEN"]

    response = http.request(req)

    json = JSON.parse(response.body)

    json["data"].each do |currency|
      c = Cryptocurrency.where(symbol: currency["symbol"]).first_or_initialize
      c.price = currency["quote"]["USD"]["price"]
      c.save!
    end
  end
end
