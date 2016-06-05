class CreateGspcs < ActiveRecord::Migration
  def change
    create_table :gspcs do |t|
      t.date :date
      t.decimal :open
      t.decimal :close
      t.decimal :high
      t.decimal :low
      t.integer :volume

      t.timestamps null: false
    end
  end
end
