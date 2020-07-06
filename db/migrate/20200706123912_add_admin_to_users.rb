class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    #            table name, field name, type, default value
    add_column :users, :admin, :boolean, default: false
  end
end
