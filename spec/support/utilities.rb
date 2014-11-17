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