set :output, "log/whenever.log"
every 1.minute do
  rake "coinmarketcap:request_sender"
end
