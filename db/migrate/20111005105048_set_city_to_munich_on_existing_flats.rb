class SetCityToMunichOnExistingFlats < ActiveRecord::Migration
  def up
    Flat.update_all('city="München"', "city IS NULL")
  end

  def down
    Flat.update_all('city=NULL')
  end
end
