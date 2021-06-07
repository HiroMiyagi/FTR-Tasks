class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name_kana, :string, null: false, default: ""
    add_column :users, :first_name_kana, :string, null: false, default: ""
    add_column :users, :employee_num, :string, null: false, default: ""

  end
end
