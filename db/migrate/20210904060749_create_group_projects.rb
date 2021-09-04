class CreateGroupProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :group_projects do |t|
      t.references :group, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
