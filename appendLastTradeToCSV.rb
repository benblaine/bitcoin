require "net/https"
require "open-uri"
require "uri"
require 'json'

##COINBASE PRICE##

coinbaseLatestPriceUSD = JSON.parse(URI.parse("https://api.exchange.coinbase.com/products/BTC-USD/ticker").read)['price'].to_f


open('coinbasePrice.csv', 'a') { |f|
 # f.puts "#{Time.now}, #{coinbaseLatestPriceUSD}"
  f.puts "#{coinbaseLatestPriceUSD}"
}

## USDZAR EXCHANGE RATE

	# 1. Get the response from Open Exchanges with URI.parse
	# 2. .read puts the response into text
	# 3. JSON Parse puts the text into hash
	# 4. ['rates']['ZAR'] extracts the ZAR value and sets it to the variable

########## REMOVED FOR CRON JOB TEST ####   exchangeRateUSDZAR = JSON.parse(URI.parse("https://openexchangerates.org/api/latest.json?app_id=0b595be49a1c46ac917d8be2f93931fa").read)['rates']['ZAR']




=begin

##BITX##

uri = URI.parse("https://api.mybitx.com/api/1/ticker?pair=XBTZAR")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)

responsebitx = http.request(request)
responsebitx.body
#response.status
responsebitx["header-here"] # All headers are lowercase

ticker_hashbitx = JSON.parse(responsebitx.body)

lasttradeValue = ticker_hashbitx['last_trade']

puts "Latest BitX Price: R#{lasttradeValue.to_f}"

spread = (lasttradeValue.to_f-lasttradepriceinZAR) 
spreadpercent = (spread / lasttradeValue.to_f * 100)
puts "Latest Spread value: R#{spread}"
puts ">>>>>>>>>>>>>>>>Latest Spread difference: #{spreadpercent}%<<<<<<<<<<<<<<<<"




# coinbase time
coinbasetime = ticker_hash['time']
bitxtime = Time.at(ticker_hashbitx['timestamp']/1000-7200).utc
USDZAR = Time.at(resJSON['timestamp']/1000).utc


puts """
The data is this old:
Coinbase: #{coinbasetime}
BitX: #{bitxtime}
USDZAR: #{bitxtime}
Now: #{Time.now.utc}
"""

open('bitcoin.txt', 'a') { |f|
  f.puts "#{Time.now}, #{spreadpercent}, #{spread}, #{exchangerateUSDZAR}, #{lasttradeValue}, #{lasttradepriceinZAR},  "
}



=end