class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :sender_type
      t.integer :recipient_id
      t.integer :recipient_type
      t.text :content
      t.timestamps null: false
    end
  end
end
