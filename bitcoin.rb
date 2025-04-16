require "net/http"
require "json"
require "pry"

class Bitcoin
  def initialize(url)
    @url = url
  end

  def actual_price
    puts "The current price of bitcoin n USD dollars is #{bitcoin_price}"
  end

  private

  def fetch_bitcoin_price
    url = URI("https://api.coindesk.com/v1/bpi/currentprice/BTC.json")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)

    return data['bpi']['USD']['date']
  end
end 

Bitcoin.new("https://api.coindesk.com/v1/bpi/currentprice/BTC.json").actual_price