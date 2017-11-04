class CreateAreas < ActiveRecord::Migration[4.2]
  def change
    create_table :areas do |t|
      t.text :area_type
      t.integer :mentor_id
      t.timestamps null: false
    end
  end
end
