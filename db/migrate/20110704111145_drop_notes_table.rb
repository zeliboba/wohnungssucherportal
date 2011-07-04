class DropNotesTable < ActiveRecord::Migration
  def self.up
    drop_table :notes
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
