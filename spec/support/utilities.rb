include ApplicationHelper

def create_actors
  [
    "Vanessa Bayer",
    "Aidy Bryant",
    "Taran Killam",
    "Kate McKinnon",
    "Bobby Moynihan",
    "Jay Pharoah",
    "Cecily Strong",
    "Kenan Thompson",
    "Beck Bennett",
    "Pete Davidson",
    "Leslie Jones",
    "Kyle Mooney",
    "Sasheer Zamata"
  ].map { |name| Actor.create(name: name) }
end

def create_users
  ["Scrooge", "Huey", "Duey", "Louie"].map { |name| User.create!(username: name) }
end

def create_league(creator)
  League.create!(name: "DuckTales", creator: creator)
end

def create_teams(users, league)
  users.map do |user| 
    Team.create!(owner: user, league: league, name: "Team #{user.username}")
  end
end

def initialize_league
  users = create_users
  league = create_league(users.first)
  teams = create_teams(users, league)
  [users, league, teams]
end

def draft_random(user, league, teams)
  team = teams.select do |team| 
    team.owner_id = user.id && team.league_id = league.id
  end.first
  
  #todo
  
end