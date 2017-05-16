namespace :periscopio do
	task :ingestGeo => :environment do
		require 'csv'
		puts "Opening CSV"
		file = "public/geocode.csv"
		puts "Updating DB"
		n=0
		CSV.foreach(file, :headers => true, :encoding => 'utf-8') do |row|
			puts "row #{n}"
			place = Location.find_or_create_by_id(row[0])
			if (!place)
				puts "could not find place #{row[0]}"
			else
				place.department = row[1]
				place.city = row[2]
				place.lon = row[3]
				place.lat = row[4]
				if place.save
					n=n+1
					puts "Saved #{place.city} #{place.department} with #{place.lat},#{place.lon}"
				end
			end
		end
		puts "CSV Import Successful, #{n} new records updated in database"
		puts "Finished!"
	end
end