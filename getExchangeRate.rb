require "open-uri"
require "uri"
require 'json'

# OPEN EXCHANGE: GET THE USDZAR EXCHANGE RATE DATA #

		currencyExchangeTicker = JSON.parse(URI.parse("https://openexchangerates.org/api/latest.json?app_id=0b595be49a1c46ac917d8be2f93931fa").read)

	# OPEN EXCHANGE USDZAR RATE

		exchangeRateUSDZAR = currencyExchangeTicker['rates']['ZAR'].to_f
	
	# COINBASE TIME
		
		exchangeRateTime = currencyExchangeTicker['timestamp']


# WRITE TO CSV #

open('exchangeRateUSDZAR.csv', 'w') { |f|
  f.puts "Currency Exchange Time, USDZAR Exchange Rate\n#{exchangeRateTime}, #{exchangeRateUSDZAR}"
}