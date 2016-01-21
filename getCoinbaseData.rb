require "open-uri"
require "uri"
require 'json'

# COINBASE

# GET THE COINBASE LAST BITCOIN TRADE DATA #

	# Get Ticker data from API
		# URI.parse: Get the response from Open Exchanges API
		coinbaseTicker = JSON.parse(URI.parse("https://api.exchange.coinbase.com/products/BTC-USD/ticker").read)

	# COINBASE PRICE

		
		# 1:  .read: Store response as text
		# 2:  JSON.parse: Convert text to hash
		# 3:  ['price'].to_i: Extracts the USD price value and stores it as a float value

		coinbaseLastPriceUSD = coinbaseTicker['price'].to_f
	
	# COINBASE TIME

		# Note: Coinbase returns their time in ISO8601 format.
		#       This caused an issue with the Linux EC2 instance when saving to file.
		#       So I decided to convert all times to UNIX timestamps

		# 1. URI.parse: gets the API callback from coinbase
		
		coinbaseTime = Time.iso8601("#{coinbaseTicker['time']}".sub(/ /,'T')).to_i


# WRITE TO CSV #

open('coinbasePrice.csv', 'w') { |f|
  f.puts "Coibase Last Trade Time, Coinbase Last Trade Price in USD\n#{coinbaseTime}, #{coinbaseLastPriceUSD}"
}