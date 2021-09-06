class CreateGroupProjectRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_project_relations do |t|
      t.references :project, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
