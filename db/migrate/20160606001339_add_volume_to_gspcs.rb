class AddVolumeToGspcs < ActiveRecord::Migration
  def change
  	add_column :gspcs, :volume, :integer, :limit => 8
  end
end
