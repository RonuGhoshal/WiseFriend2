class CreateMentors < ActiveRecord::Migration[4.2]
  def change
    create_table :mentors do |t|
      t.text :first_name
      t.text :last_name
      t.text :location
      t.integer :age
      t.text :gender
      t.text :mentee_preferred_gender
      t.text :email
      t.text :phone
      t.text :linkedin
      t.text :preferred_communication
      t.text :how_did_you_hear
      t.text :addl_info
      t.text :password_digest
      t.timestamps null: false
    end
  end
end
