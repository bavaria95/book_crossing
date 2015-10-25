class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester
      t.integer :requested_book
      t.integer :requested
      t.integer :requester_book
      t.string :accepted

      t.timestamps null: false
    end
  end
end
