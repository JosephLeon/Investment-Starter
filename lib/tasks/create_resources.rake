require 'nokogiri'
require 'open-uri'

namespace :resources do
  desc 'Create resources by scraping data from sites.'
  task create: :environment do
    puts 'Ran custom rake task resources:create'

    sites = [
    	'http://www.nasdaq.com/',
    	'http://finance.yahoo.com/',
    ]

    for site in sites do
    	page = Nokogiri::HTML(open(site))
    	puts page.css('title')
    	puts page.css('meta[name="description"]')
    end
  end

  task delete: :environment do
  	puts 'Ran rake task to clean out the resources table.'
  end
end
