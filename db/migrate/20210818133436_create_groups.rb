class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :create_user_id
      t.timestamps
    end
  end
end

