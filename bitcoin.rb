require "net/http"
require "json"
require "pry"

def fetch_bitcoin_price
  url = URI("https://api.coindesk.com/v1/bpi/currentprice/BTC.json")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)

  bitcoin_price = data['bpi']['USD']['date']

  puts "The current price of bitcoin in USD dollar is #{bitcoin_price}"
end

fetch_bitcoin_price