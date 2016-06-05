require 'csv'

namespace :gspc do
	task import: :environment do
		puts 'Importing all GSPC daily quotes from csv'

		csv_text = File.read(Rails.root + 'lib/assets/sp500-may2015-may2016.csv')
		csv = CSV.parse(csv_text, headers: true)
		csv.each do |row|
			puts row
		  Gspc.create!(row.to_hash)
		end
	end

	task delete: :environment do
		puts 'Deleting all records in the gspc table.'
		Gspc.delete_all
	end
end
