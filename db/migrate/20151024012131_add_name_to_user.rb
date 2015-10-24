class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :Name, :string
  end
end
