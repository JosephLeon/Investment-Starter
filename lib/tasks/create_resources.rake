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
    	
    	description_chunk = page.css("meta[name='description']").first 
    	description = description_chunk['content']

    	if Resource.where(:link => site).blank?
    	  resource = Resource.create(link: site, title: pagetitle, description: description)
    	else
    	  # skip this site
    	end

    	# @output = "" + resource + " reasource was created!"
    	# puts @output
    end
  end

  task delete: :environment do
  	puts 'Ran rake task to clean out the resources table.'
  	Resource.delete_all
  end
end
