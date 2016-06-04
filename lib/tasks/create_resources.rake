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
    	pagetitle = page.css('title').text
    	description = page.css('meta[name="description"]').text

    	@resource = Resource.create(link: site, title: pagetitle, description: description)

    	puts @resource
    end
  end

  task delete: :environment do
  	puts 'Ran rake task to clean out the resources table.'
  end
end
