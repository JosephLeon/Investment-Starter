require 'nokogiri'
require 'open-uri'

namespace :create do
  desc 'Create resources by scraping data from sites.'
  task resources: :environment do
    puts 'Ran custom rake task create:resources'

    sites = [
    	'http://www.nasdaq.com/',
    	'http://finance.yahoo.com/',
    ]

    for site in sites do
    	page = Nokogiri::HTML(open(site))
    	puts page
    end

  end
end
