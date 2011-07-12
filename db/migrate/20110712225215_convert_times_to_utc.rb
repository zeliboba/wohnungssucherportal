class ConvertTimesToUtc < ActiveRecord::Migration
  
  DATETIME_FIELDS = %w(created_at updated_at visit_at)
  
  def self.up
    DATETIME_FIELDS.each do |attribute|
      execute "UPDATE flats SET #{attribute} = #{attribute} - INTERVAL 2 HOUR"
    end
  end

  def self.down
    DATETIME_FIELDS.each do |attribute|
      execute "UPDATE flats SET #{attribute} = #{attribute} + INTERVAL 2 HOUR"
    end
  end
end
