require 'csv'
require "open-uri"
require "uri"
require 'json'

# BITX: GET THE BITX BIDS FROM THE ORDERBOOK #
		
		# Get JSON response and store as text: URI.parse
		bitxOrders = JSON.parse(URI.parse("https://api.mybitx.com/api/1/orderbook?pair=XBTZAR").read)

		# GET BIDS
		bitxBids = bitxOrders['bids']
	
	# BITX TIME
		
		bitxTime = bitxOrders['timestamp']/1000


csv_string = CSV.generate do |csv|
  bitxBids.each do |hash|
    csv << hash.values
  end
end


open('bitxBids.csv', 'w') { |f|
  f.puts "Bid Price ZAR, Bid Volume BTC\n#{csv_string}"
}

open('bitxTime.csv', 'w') { |f|
  f.puts "BitX Time\n#{bitxTime}"
}