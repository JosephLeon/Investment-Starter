class CreateGspcs < ActiveRecord::Migration
  def change
    create_table :gspcs do |t|

      t.timestamps null: false
    end
  end
end
