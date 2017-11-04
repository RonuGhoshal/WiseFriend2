class CreateMentorships < ActiveRecord::Migration[4.2]
  def change
    create_table :mentorships do |t|
      t.integer :mentee_id
      t.integer :mentor_id
      t.timestamps null: false
    end
  end
end
