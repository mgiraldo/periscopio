class Violence < ActiveRecord::Base
  has_one :actor
  has_one :location
  has_one :violence_type
  
  def self.migrateTable
    results = connection.execute("select * from violencia")
    results.each do |row|
      location = Location.where("department = ? AND city = ?", row[1].to_s.strip, row[2].to_s.strip).first
      actor = Actor.where(:name=>row[3].to_s.strip).first
      type = ViolenceType.where(:name=>row[4].to_s.strip).first
      v = Violence.new
      v.location_id = location.id
      v.actor_id = actor.id
      v.violence_type_id = type.id
      v.year_of = row[5]
      v.death_count = row[6]
      v.save
    end
  end
end
