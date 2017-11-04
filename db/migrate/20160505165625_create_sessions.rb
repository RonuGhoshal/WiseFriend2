class CreateSessions < ActiveRecord::Migration[4.2]
  def change
    create_table :sessions do |t|

      t.timestamps null: false
    end
  end
end
