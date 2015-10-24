class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :requester # person who initiate transaction
      t.integer :requested_book # book which is wanted by requester
      t.integer :requested # person who has desired book
      t.integer :requester_book # book which requested person want in return
      t.string :accepted # status of request(waiting, accepted, rejected)

      t.timestamps null: false
    end
  end
end
