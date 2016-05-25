class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.integer :mentee_id
      t.integer :mentor_id
      t.timestamps null: false
    end
  end
end
