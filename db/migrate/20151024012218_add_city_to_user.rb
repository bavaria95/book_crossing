class AddCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :City, :string
  end
end
