class AddColumnToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :getflow_id, :integer
  end
  def self.down
    remove_column :todos, :getflow_id, :integer
  end
end
