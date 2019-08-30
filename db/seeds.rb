require_relative '../lib/task_tracker.rb'

kanban_board = Kanban_board.create(title: "FlatIron_Kanban")

employee_1 = Employee.create(name: "Margaux", title: "President")
employee_2 = Employee.create(name: "Seb", title: "Head of Communication")

task_1 = Task.create(name: "Send speaker invite", status: "ongoing", deadline: "12.09.19", employee_id: employee_1.id, kanban_board_id: kanban_board.id)
task_2 = Task.create(name: "Design brand guidelines", status: "todo", deadline: "17.09.19", employee_id: employee_1.id, kanban_board_id: kanban_board.id)
task_3 = Task.create(name: "Print posters", status: "done", deadline: "29.08.19", employee_id: employee_2.id, kanban_board_id: kanban_board.id)