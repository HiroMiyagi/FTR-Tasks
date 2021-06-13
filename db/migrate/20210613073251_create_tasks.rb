class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string      :name, null: false, limit: 255
      t.text        :content, limit: 1000
      t.date :time_limit
      t.integer    :priority_id
      t.references  :project, null: false, foreign_key: true
      t.integer :create_user_id
      t.timestamps
    end
  end
end
