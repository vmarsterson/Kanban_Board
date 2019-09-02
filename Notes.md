# Challenges

+ Many to many relationships in lib/tasktracker
If it's a many to many - how do we write this?
has_many :employees, :through => :joiningtable?

+ Is the rakefile where we define the rake commands we can run in the terminal?

If so, why did we use the terminal to auto-matically create the migrate file? Should this have been done through the rakefile and then called upon?

+ Am I right to have a kanban_board class? Like the gallery? Or is it a status_column object? Or neither, and this is down to formatting rather than actual objects?

+ What is this doing?

<%kanban_boards.each do |kanban_board|%>

iterating over kanban_boards table with new values? Where from?

+ How do I stop shotgun? It won't disconnect. 

# To remember

+ You can use rake -T at any point to see the tasks you can do with Rake
+ To generate your migrate file, use rake db:create_migrate (NAME=****) with ** being the name of the file you want to make e.g. create_tables
+ Once you've created your migrate files and lib file, use rake db:migrate to make the tables
+ create your seed data and then use rake db:seed to put the data into the tables

# Project Todo List

+ Create forms for inputs:
    Input kanban board title
    Create kanban board

    Input task title
    Input task deadline
    Create task 
    Add to todo column

    #Input employee name
    #Create employee

+ Tasks can be manipulated
    Move between columns
    Can be deleted
    Title/Deadline can be edited


    + Calendar link:

    https://api.jqueryui.com/datepicker/#option-classes