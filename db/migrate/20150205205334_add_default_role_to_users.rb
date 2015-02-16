class AddDefaultRoleToUsers < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :default => "U"
  end
end
