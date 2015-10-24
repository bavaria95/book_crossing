class ChangeNameOfEntity < ActiveRecord::Migration
  def change
  	rename_table :requests, :transactions
  end
end
