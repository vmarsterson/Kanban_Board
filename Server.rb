require 'sinatra'
require 'sinatra/activerecord'
require_relative './lib/task_tracker.rb'

class Server < Sinatra::Base
    get '/' do
        erb :index, locals: {kanban_boards: Kanban_board.all}
    end

    post '/kanbanBoard' do
        kanbanTitle = params["boardTitle"]
        Kanban_board.create(title: kanbanTitle, status_column: "todo")
        id = Kanban_board.all.last.id
        erb :kanban_display, locals: {kanban_board: Kanban_board.find(id)}
    end

    get '/kanbanBoard' do
        id = params["boardID"]
        erb :kanban_display, locals: {kanban_board: Kanban_board.find(id)}
    end
end