class Kanban_board < ActiveRecord::Base
    has_many :tasks
    has_many :employees, through: :tasks 
end

class Task < ActiveRecord::Base
    belongs_to :employee
    belongs_to :kanban_board
end

class Employee < ActiveRecord::Base
    has_many :tasks
end
