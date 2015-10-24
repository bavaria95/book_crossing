class FixColumnsNames < ActiveRecord::Migration
  def change
  	rename_column :books, :descriprion, :description
  	rename_column :users, :City, :city
  	rename_column :users, :Name, :name
  end
end
