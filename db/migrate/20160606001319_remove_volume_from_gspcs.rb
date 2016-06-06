class RemoveVolumeFromGspcs < ActiveRecord::Migration
  def change
    remove_column :gspcs, :volume, :integer
  end
end
