require "httparty"
require "json"
require "pry"

class Bitcoin
  API_KEY = "b92b2638-81ef-495b-80ae-0c2588a1b585"
   API_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest"

   def fetch(symbol = 'BTC')
    response = HTTParty.get(
      API_URL,
      headers: { 'X-CMC_PRO_API_KEY' => API_KEY },
      query: { 'symbol' => symbol }
    )

    if response.success?
      price = fetch_bitcoin_price(response.body, symbol)
      rounded_price = price.round(2)
      puts "The current price of #{symbol} in USD dollars is $#{rounded_price}"
    else
      puts "Error: #{response.code} - #{response.body}"
    end
  end

  private

  def fetch_bitcoin_price(json_response, symbol)
    data = JSON.parse(json_response)
    data['data'][symbol]['quote']['USD']['price']
  end
end 

fetcher = Bitcoin.new
fetcher.fetch('BTC')