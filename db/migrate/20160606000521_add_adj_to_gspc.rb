class AddAdjToGspc < ActiveRecord::Migration
  def change
    add_column :gspcs, :adj, :decimal
  end
end
