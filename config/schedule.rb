set :output, "log/whenever.log"
every 5.minutes do
  rake "coinmarketcap:request_sender"
end
