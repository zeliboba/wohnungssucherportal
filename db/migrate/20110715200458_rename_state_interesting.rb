class RenameStateInteresting < ActiveRecord::Migration
  def up
    execute("UPDATE flats SET state='new' where state='interesting'")
  end

  def down
    execute("UPDATE flats SET state='interesting' where state='new'")
  end
end
