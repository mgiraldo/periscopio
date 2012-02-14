class Location < ActiveRecord::Base
  belongs_to :violence
  
  def self.pushToDB
    FasterCSV.foreach("municipiosGeocoded.csv") do |row|
      if row[2].to_s.strip != "lat-lon"
        arr = row[0].split(",")
        puts "state: #{arr[1]} city: #{arr[0]} latlon: #{row[2]}"
        l = Location.new
        l.department = arr[1].to_s.strip
        l.city = arr[0].to_s.strip
        l.lat = row[2].to_s.strip.split(",")[0].to_f
        l.lon = row[2].to_s.strip.split(",")[1].to_f
        l.save
      end
    end
  end
end
