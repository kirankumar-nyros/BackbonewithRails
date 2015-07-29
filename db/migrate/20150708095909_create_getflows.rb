class CreateGetflows < ActiveRecord::Migration
  def change
    create_table :getflows do |t|
      t.string :name
      t.string :title
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
