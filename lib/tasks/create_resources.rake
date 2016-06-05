require 'nokogiri'
require 'open-uri'

namespace :resources do
  desc 'Create resources by scraping data from sites.'
  task create: :environment do
    puts 'Ran custom rake task resources:create'

    sites = [
    	'http://www.nasdaq.com/',
    	'http://finance.yahoo.com/',
    	'http://www.cmegroup.com/trading/interest-rates/countdown-to-fomc.html',
    	# 'http://www.bankrate.com/finance/federal-reserve/what-did-federal-reserve-say.aspx',
    	'http://www.investopedia.com/',
    	'http://longforecast.com/brent/crude-oil-forecast-for-2015-2016-and-2017.html',
    	'https://www.earningswhispers.com/calendar',
    ]

    for site in sites do
    	page = Nokogiri::HTML(open(site))
    	pagetitle = page.css('title').text
    	
    	description_chunk = page.css("meta[name='description']").first

    	description = ''
    	unless description_chunk['content'].nil?
    		description = description_chunk['content']
    		puts description
    	end

    	if Resource.where(:link => site).blank?
    	  resource = Resource.create(link: site, title: pagetitle, description: description)
    	else
    	  # skip this site
    	end

    	
    end
  end

  task delete: :environment do
  	puts 'Ran rake task to clean out the resources table.'
  	Resource.delete_all
  end
end
