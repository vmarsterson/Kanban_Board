require 'sinatra'
require 'sinatra/activerecord'
require_relative './lib/task_tracker.rb'

class Server < Sinatra::Base
    get '/' do
        erb :index, locals: {kanban_boards: Kanban_board.all}
    end
end