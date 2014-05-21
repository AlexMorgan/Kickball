require 'sinatra'
require 'csv'
require 'pry'
require 'shotgun'
# The server acts as the controller and the routes file of our "MVC"


def read_from_roster(csv)
  players = []
  CSV.foreach(csv, headers: true, header_converters: :symbol) do |player|
    players << player.to_hash
  end
  players
end

def unique_teams(roster)
  teams = []
  roster.each do |player|
    teams << player[:team]
  end
  unique_team = teams.uniq!
end

def unique_positions(roster)
  positions = []
  roster.each do |player|
    positions << player[:position]
  end
  uniq_position = positions.uniq!
end

def find_players(roster, team)
  players = []

  roster.each do |player|
    if player[:team] == team
      players << player
    end
  end
  players
end

def find_positions(roster, position)
  players = []

  roster.each do |player|
    if player[:position] == position
      players << player
    end
  end
  players
end

roster = read_from_roster('roster.csv')

#--------------------- Routes ---------------------
get '/' do
  @teams_list = unique_teams(roster)
  @positions_list = unique_positions(roster)

  erb :index
end

get '/teams/:team' do
  @team = find_players(roster, params[:team])
  erb :'teams/show'
end

get '/positions/:position' do
  @position = find_positions(roster, params[:position])
  erb :'positions/show'
end



# Optional - Already set by default
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
