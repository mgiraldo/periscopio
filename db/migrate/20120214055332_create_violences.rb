class CreateViolences < ActiveRecord::Migration
  def change
    create_table :violences do |t|
      t.references :location
      t.references :actor
      t.references :violence_type
      t.integer :year_of
      t.integer :death_count

      t.timestamps
    end
    #add foreign keys
    execute <<-SQL
      ALTER TABLE violences
        ADD CONSTRAINT fk_violences_actors
        FOREIGN KEY (actor_id)
        REFERENCES actors(id),
        ADD CONSTRAINT fk_violences_locations
        FOREIGN KEY (location_id)
        REFERENCES locations(id),
        ADD CONSTRAINT fk_violences_types
        FOREIGN KEY (violence_type_id)
        REFERENCES violence_types(id)
    SQL
  end
end
