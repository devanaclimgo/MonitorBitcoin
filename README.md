# Bitcoin Price Checker - Ruby CLI Tool
![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) 

A simple Ruby script that fetches the latest Bitcoin price from the CoinMarketCap API and displays it in a clean format.

## 🚀 Features
- Fetches real-time Bitcoin price (default) or any other cryptocurrency.
- Rounds the price to 2 decimal places (e.g., `$50,123.45`).
- Handles API errors gracefully.

## 🔧 How It Works
### 1. API Setup
- Uses the [CoinMarketCap](https://coinmarketcap.com/api/) API to get cryptocurrency prices.
- Requires an **API key** (stored in the `API_KEY` constant).

### 2. Key Techniques Used
**HTTP Requests (with `HTTParty`)**
- Sends a `GET` request to CoinMarketCap’s API endpoint.
- Includes the API key in headers for authentication.
```ruby
response = HTTParty.get(
  API_URL,
  headers: { 'X-CMC_PRO_API_KEY' => API_KEY },
  query: { 'symbol' => symbol }
)
```
**JSON Parsing**
- Extracts the price from the API’s JSON response.
```ruby
data = JSON.parse(json_response)
data['data'][symbol]['quote']['USD']['price']
```
**Rounding Numbers**
- Uses `price.round(2)` to format the price to 2 decimal places.
**Error Handling**
- Checks if the API request succeeded (`response.success?`).
- Prints errors if something goes wrong.
```ruy
if response.success?
  # Show price
else
  puts "Error: #{response.code} - #{response.body}"
end
```

### 3. Private Helper Method
- `fetch_bitcoin_price` is marked as `private` since it’s only used internally.

## 🛠️ How to Run
1. **Install dependencies** (if needed):
```bash
gem install httparty json
```
2. **Run the script:**
```bash
ruby bitcoin.rb
```
**Output Example:**
```bash
The current price of BTC in USD dollars is $50,123.45
```

## 📌 Possible Improvements
- Add **thousands separators** (e.g., `$50,123.45`).
- Cache the price for a few minutes to avoid rate limits.
- Support more cryptocurrencies by default.

##### Made with Ruby + CoinMarketCap API. Happy coding! 💎🚀
###### Built with ❤️ by Ana - 2025
