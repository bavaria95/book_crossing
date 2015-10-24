class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :descriprion

      t.timestamps null: false
    end
  end
end
