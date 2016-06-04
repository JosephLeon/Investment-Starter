class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :link
      t.text :description
      t.string :title

      t.timestamps null: false
    end
  end
end
