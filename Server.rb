require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra-websocket'
require_relative './lib/task_tracker.rb'

class Server < Sinatra::Base
    set :sockets, Array.new

    get '/' do
        request.websocket do |ws|
            ws.onopen do
                settings.sockets << ws
            end

            ws.onmessage do |msg|
                p msg
                EM.next_tick {settings.sockets.each {|socket| socket.send(msg)}}
            end

            ws.onclose do
                settings.sockets.delete(ws)
            end
        end
    end

    get '/index' do
        erb :index, locals: {kanban_boards: Kanban_board.all}
    end

    post '/kanbanBoard' do
        kanbanTitle = params["boardTitle"]
        Kanban_board.create(title: kanbanTitle, status_column: "todo")
        id = Kanban_board.all.last.id
        redirect '/kanbanBoard?boardID=' + id.to_s
    end

    get '/kanbanBoard' do
        todo = []
        ongoing = []
        done = []

        board = Kanban_board.find(params["boardID"])
        board.tasks.each do |task|
            if task.status == "done"
                done << task
            elsif task.status == "ongoing"
                ongoing << task
            else
                todo << task
            end
  
        end
        erb :kanban_display, locals: {kanban_board: board, todo: todo, ongoing: ongoing, done: done}

        request.websocket do |ws|
            ws.onopen do
                settings.sockets << ws
            end

            ws.onmessage do |msg|
                p msg
                EM.next_tick {settings.sockets.each {|socket| socket.send(msg)}}
            end

            ws.onclose do
                settings.sockets.delete(ws)
            end
        end
    end

    post '/kanbanBoard/:id' do
        taskName = params["taskName"]
        taskStatus = params["taskStatus"]
        taskDeadline = params["taskDeadline"]
        board_id = params["id"]
        Task.create(name: taskName, status: taskStatus, deadline: taskDeadline, kanban_board_id: board_id)
        redirect '/kanbanBoard?boardID=' + board_id.to_s
    end
    
end