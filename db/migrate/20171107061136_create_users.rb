class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :location
      t.integer :age
      t.string :gender
      t.string :phone
      t.string :linkedin
      t.string :preferred_communication
      t.string :how_did_you_hear
      t.string :addl_info
      t.string :challenge1
      t.string :challenge2
      t.string :challenge3
      t.text :areas_of_expertise, array: true, default: []
      t.timestamps null: false
    end
  end
end
