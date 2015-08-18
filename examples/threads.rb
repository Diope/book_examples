require 'net/http'

pages = %w( www.yahoo.com bing.com www.google.com dipet.me)

threads = pages.map do |page_to_fetch|
	Thread.new(page_to_fetch) do |url|
		http = Net::HTTP.new(url, 80)
		print "Fetching: #{url}\n"
		resp = http.get('/')
		print "Got #{url}: #{resp.message}\n"
	end
end
threads.each {|thr| thr.join}