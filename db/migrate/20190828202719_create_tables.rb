class CreateTables < ActiveRecord::Migration[5.2]
  def up
    create_table :tasks do |col|
      col.string :name
      col.string :status
      col.string :deadline
      col.integer :employee_id
      col.integer :kanban_board_id
  end

  create_table :employees do |col|
    col.string :name
    col.string :title
  end

  create_table :kanban_boards do |col|
    col.string :title
    col.string :status_column
  end
end

  def down
    remove_table :tasks
    remove_table :employees
    remove_table :kanban_boards
  end
end
