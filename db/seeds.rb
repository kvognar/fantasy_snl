# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

lead = ScoringType.create(description: "Lead a sketch", value: 3)
appear = ScoringType.create(description: "Appear in a sketch", value: 2)
non_speaking = ScoringType.create(description: "Non-speaking role in a sketch", value: 1)
live = ScoringType.create(description: '"Live from New York"', value: 2)
impersonate = ScoringType.create(description: "Impersonate a celebrity with the celebrity", value: 4)
open_mono = ScoringType.create(description: "Appear in the opening monologue", value: 1)
weekend_char = ScoringType.create(description: "Appear in Weekend Update as a character", value: 3)
weekend_self = ScoringType.create(description: "Appear in Weekend Update as themselves", value: 4)
breaking = ScoringType.create(description: "Breaking (with actual laughter)", value: -1)
skill = ScoringType.create(description: "Additional display of skill", value: 3)
fcc = ScoringType.create(description: "FCC violation", value: -2)


bayer = Actor.create(name:"Vanessa Bayer")
bryant = Actor.create(name: "Aidy Bryant")
killam = Actor.create(name: "Taran Killam")
mckinnon = Actor.create(name: "Kate McKinnon")
moynihan = Actor.create(name: "Bobby Moynihan")
pharoah = Actor.create(name: "Jay Pharoah")
strong = Actor.create(name: "Cecily Strong")
thompson = Actor.create(name: "Kenan Thompson")
bennett = Actor.create(name: "Beck Bennett")
davidson = Actor.create(name: "Pete Davidson")
jones = Actor.create(name: "Leslie Jones")
mooney = Actor.create(name: "Kyle Mooney")
zamata = Actor.create(name: "Sasheer Zamata")

pratt, silverman, hader, carrey, rock, harrelson, diaz = [
  ["Chris Pratt", Date.new(2014, 9, 27)],
  ["Sarah Silverman", Date.new(2014, 10, 4)],
  ["Bill Hader", Date.new(2014, 10, 11)],
  ["Jim Carrey", Date.new(2014, 10, 25)],
  ["Chris Rock", Date.new(2014, 11, 1)],
  ["Woody Harrelson", Date.new(2014, 11, 15)],
  ["Cameron Diaz", Date.new(2014, 11, 22)]
].map { |host, date| Episode.create(host: host, air_date: date) }


# Chris Pratt episode

Scoring.create(scoring_type: lead, actor: bayer, episode: pratt)
2.times { Scoring.create(scoring_type: appear, actor: bayer, episode: pratt) }

Scoring.create(scoring_type: lead, actor: bennett, episode: pratt)
3.times { Scoring.create(scoring_type: appear, actor: bennett, episode: pratt) }
Scoring.create(scoring_type: non_speaking, actor: bennett, episode: pratt)

2.times { Scoring.create(scoring_type: lead, actor: bryant, episode: pratt) }
Scoring.create(scoring_type: appear, actor: bryant, episode: pratt)
Scoring.create(scoring_type: non_speaking, actor: bryant, episode: pratt)
Scoring.create(scoring_type: live, actor: bryant, episode: pratt)

2.times { Scoring.create(scoring_type: appear, actor: davidson, episode: pratt) }
Scoring.create(scoring_type: weekend_self, actor: davidson, episode: pratt)

3.times { Scoring.create(scoring_type: lead, actor: killam, episode: pratt) }
Scoring.create(scoring_type: appear, actor: killam, episode: pratt)
Scoring.create(scoring_type: non_speaking, actor: killam, episode: pratt)

Scoring.create(scoring_type: lead, actor: mckinnon, episode: pratt)
Scoring.create(scoring_type: appear, actor: mckinnon, episode: pratt)

Scoring.create(scoring_type: lead, actor: mooney, episode: pratt)
6.times { Scoring.create(scoring_type: appear, actor: mooney, episode: pratt) }

3.times { Scoring.create(scoring_type: lead, actor: moynihan, episode: pratt) }
Scoring.create(scoring_type: non_speaking, actor: moynihan, episode: pratt)

2.times { Scoring.create(scoring_type: appear, actor: pharoah, episode: pratt) }
Scoring.create(scoring_type: non_speaking, actor: pharoah, episode: pratt)

2.times { Scoring.create(scoring_type: lead, actor: strong, episode: pratt) }
2.times { Scoring.create(scoring_type: appear, actor: strong, episode: pratt) }
Scoring.create(scoring_type: weekend_char, actor: strong, episode: pratt)

3.times { Scoring.create(scoring_type: appear, actor: thompson, episode: pratt) }
Scoring.create(scoring_type: weekend_char, actor: thompson, episode: pratt)

2.times { Scoring.create(scoring_type: appear, actor: zamata, episode: pratt) }

# Sarah Silverman episode

Scoring.create(scoring_type: lead, actor: bayer, episode: silverman)
Scoring.create(scoring_type: appear, actor: bayer, episode: silverman)

2.times { Scoring.create(scoring_type: lead, actor: bennett, episode: silverman) }
2.times { Scoring.create(scoring_type: appear, actor: bennett, episode: silverman) }

2.times { Scoring.create(scoring_type: appear, actor: bryant, episode: silverman) }

Scoring.create(scoring_type: lead, actor: killam, episode: silverman)
4.times { Scoring.create(scoring_type: appear, actor: killam, episode: silverman) }

3.times { Scoring.create(scoring_type: appear, actor: mckinnon, episode: silverman) }
Scoring.create(scoring_type: weekend_char, actor: mckinnon, episode: silverman)
Scoring.create(scoring_type: skill, actor: mckinnon, episode: silverman)

Scoring.create(scoring_type: lead, actor: mooney, episode: silverman)
Scoring.create(scoring_type: non_speaking, actor: mooney, episode: silverman)

Scoring.create(scoring_type: lead, actor: moynihan, episode: silverman)
Scoring.create(scoring_type: appear, actor: moynihan, episode: silverman)

Scoring.create(scoring_type: lead, actor: pharoah, episode: silverman)
Scoring.create(scoring_type: appear, actor: pharoah, episode: silverman)
Scoring.create(scoring_type: live, actor: pharoah, episode: silverman)

Scoring.create(scoring_type: lead, actor: strong, episode: silverman)
Scoring.create(scoring_type: appear, actor: strong, episode: silverman)
Scoring.create(scoring_type: non_speaking, actor: strong, episode: silverman)

Scoring.create(scoring_type: lead, actor: thompson, episode: silverman)
2.times { Scoring.create(scoring_type: appear, actor: thompson, episode: silverman) }
Scoring.create(scoring_type: non_speaking, actor: thompson, episode: silverman)
Scoring.create(scoring_type: weekend_char, actor: thompson, episode: silverman)

Scoring.create(scoring_type: lead, actor: zamata, episode: silverman)
Scoring.create(scoring_type: appear, actor: zamata, episode: silverman)

# Bill Hader episode

2.times { Scoring.create(scoring_type: appear, actor: bayer, episode: hader) }

Scoring.create(scoring_type: lead, actor: bennett, episode: hader)
3.times { Scoring.create(scoring_type: appear, actor: bennett, episode: hader) }

2.times { Scoring.create(scoring_type: appear, actor: bryant, episode: hader) }

Scoring.create(scoring_type: lead, actor: davidson, episode: hader)
3.times { Scoring.create(scoring_type: appear, actor: davidson, episode: hader) }
Scoring.create(scoring_type: non_speaking, actor: davidson, episode: hader)
Scoring.create(scoring_type: weekend_self, actor: davidson, episode: hader)

Scoring.create(scoring_type: lead, actor: killam, episode: hader)
5.times { Scoring.create(scoring_type: appear, actor: killam, episode: hader) }

2.times { Scoring.create(scoring_type: appear, actor: mckinnon, episode: hader) }

Scoring.create(scoring_type: lead, actor: mooney, episode: silverman)
2.times { Scoring.create(scoring_type: appear, actor: mooney, episode: silverman) }

Scoring.create(scoring_type: lead, actor: moynihan, episode: silverman)
2.times { Scoring.create(scoring_type: appear, actor: moynihan, episode: silverman) }
Scoring.create(scoring_type: live, actor: moynihan, episode: silverman)

2.times { Scoring.create(scoring_type: appear, actor: pharoah, episode: silverman) }

Scoring.create(scoring_type: lead, actor: strong, episode: silverman)
5.times { Scoring.create(scoring_type: appear, actor: strong, episode: silverman) }

Scoring.create(scoring_type: appear, actor: thompson, episode: silverman)
Scoring.create(scoring_type: non_speaking, actor: thompson, episode: silverman)

2.times { Scoring.create(scoring_type: appear, actor: zamata, episode: silverman) }

# Jim Carrey episode

4.times { Scoring.create(scoring_type: appear, actor: bayer, episode: carrey) }
Scoring.create(scoring_type: impersonate, actor: bayer, episode: carrey)
Scoring.create(scoring_type: weekend_char, actor: bayer, episode: carrey)

4.times { Scoring.create(scoring_type: appear, actor: bennett, episode: carrey) }
Scoring.create(scoring_type: non_speaking, actor: bennett, episode: carrey)
Scoring.create(scoring_type: impersonate, actor: bennett, episode: carrey)

2.times { Scoring.create(scoring_type: appear, actor: bryant, episode: carrey) }

2.times { Scoring.create(scoring_type: appear, actor: davidson, episode: carrey) }
Scoring.create(scoring_type: non_speaking, actor: davidson, episode: carrey)

Scoring.create(scoring_type: lead, actor: killam, episode: carrey)
5.times { Scoring.create(scoring_type: appear, actor: killam, episode: carrey) }
Scoring.create(scoring_type: impersonate, actor: killam, episode: carrey)

Scoring.create(scoring_type: lead, actor: mckinnon, episode: carrey)
Scoring.create(scoring_type: appear, actor: mckinnon, episode: carrey)
Scoring.create(scoring_type: skill, actor: mckinnon, episode: carrey)

4.times { Scoring.create(scoring_type: appear, actor: mooney, episode: carrey) }
Scoring.create(scoring_type: impersonate, actor: mooney, episode: carrey)

4.times { Scoring.create(scoring_type: appear, actor: moynihan, episode: carrey) }
Scoring.create(scoring_type: impersonate, actor: moynihan, episode: carrey)
Scoring.create(scoring_type: weekend_char, actor: moynihan, episode: carrey)

4.times { Scoring.create(scoring_type: appear, actor: pharoah, episode: carrey) }
Scoring.create(scoring_type: non_speaking, actor: pharoah, episode: carrey)
Scoring.create(scoring_type: impersonate, actor: pharoah, episode: carrey)

6.times { Scoring.create(scoring_type: appear, actor: strong, episode: carrey) }
Scoring.create(scoring_type: impersonate, actor: strong, episode: carrey)

5.times { Scoring.create(scoring_type: appear, actor: thompson, episode: carrey) }
Scoring.create(scoring_type: live, actor: thompson, episode: carrey)

4.times { Scoring.create(scoring_type: appear, actor: zamata, episode: carrey) }

Scoring.create(scoring_type: lead, actor: jones, episode: carrey)
Scoring.create(scoring_type: appear, actor: jones, episode: carrey)