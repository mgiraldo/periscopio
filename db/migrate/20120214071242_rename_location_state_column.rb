class RenameLocationStateColumn < ActiveRecord::Migration
  def change
    rename_column :locations, :state, :department
  end
end
