class CreateMentorSurveys < ActiveRecord::Migration
  def change
    create_table :mentor_surveys do |t|
      t.integer :rating
      t.boolean :continue
      t.text :content
      t.timestamps null: false
    end
  end
end
