class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.text :first_name
      t.text :last_name
      t.text :location
      t.integer :age
      t.text :gender
      t.text :mentor_preferred_gender
      t.text :email
      t.text :phone
      t.text :preferred_communication
      t.text :how_did_you_hear
      t.text :addl_info
      t.text :challenge1
      t.text :challenge2
      t.text :challenge3
      t.text :password_digest
      t.timestamps null: false
    end
  end
end
