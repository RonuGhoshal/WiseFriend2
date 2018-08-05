class CreateMentorships < ActiveRecord::Migration[5.1]
  def change
    create_table :mentorships do |t|
      t.references :mentor, index: true, foreign_key: { to_table: :users }, null: false
      t.references :mentee, index: true, foreign_key: { to_table: :users }, null: false
    end
  end
end
