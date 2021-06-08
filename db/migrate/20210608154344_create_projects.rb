class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|

      t.string :name, null: false
      t.string :job_num, null: false
      t.integer :order_amount, null: false
      t.date :delivery_date, null: false
      t.integer :create_user_id, null: false

      t.timestamps
    end
  end
end
