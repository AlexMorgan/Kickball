require 'csv'
require 'pry'

roster = "roster.csv"

def csv_data(file)
  league_arr = []

  CSV.foreach(file, headers: true) do |row|
    # Instantiate hash for each player and populate info from our CSV row indices
    player = {}
    player[:f_name] = row[0].downcase
    player[:l_name] = row[1].downcase
    player[:position] = row[2].downcase
    player[:team] = row[3].downcase
    # Append to our leage array
    league_arr << player
  end
  league_arr
end

@league = csv_data(roster)

def players_for_team(team)
  @league.select { |player| player[:team] == team }
end

def players_for_position(position)
    @league.select { |player| player[:position] == position }
end


# puts players_for_team("simpson slammers")
# puts players_for_team("jetson jets")
# puts players_for_team("flinestone fire")
# puts players_for_team("griffin goats")

players_for_position("catcher")
players_for_position("pitcher")
players_for_position("1st base")
players_for_position("2nd base")
players_for_position("3rd base")
players_for_position("shortstop")
players_for_position("right field")
players_for_position("center field")
players_for_position("left field")

