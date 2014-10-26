# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ScoringType.create(description: "Lead a sketch", value: 3)
ScoringType.create(description: "Appear in a sketch", value: 2)
ScoringType.create(description: "Non-speaking role in a sketch", value: 1)
ScoringType.create(description: '"Live from New York"', value: 2)
ScoringType.create(description: "Impersonate a celebrity with the celebrity", value: 4)
ScoringType.create(description: "Appear in the opening monologue", value: 1)
ScoringType.create(description: "Appear in Weekend Update as a character", value: 3)
ScoringType.create(description: "Appear in Weekend Update as themselves", value: 4)
ScoringType.create(description: "Breaking (with actual laughter)", value: -1)
ScoringType.create(description: "Additional display of skill", value: 3)
ScoringType.create(description: "FCC violation", value: -2)

