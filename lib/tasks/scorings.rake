namespace :scorings do
  task :transfer_scorings => :environment do
    desc 'creates scorings for teams based on actor scorings'
    transfer_scorings
  end
end


def transfer_scorings
  if Scoring.where.not(team: nil).count > 0
    puts "Scorings have already been transferred!"
    return
  end

  Team.includes(members: [scorings: :scoring_type]).all.each do |team|
    team.members.each do |actor|
      actor.scorings.canonical.each do |scoring|
        team.scorings.create(actor: actor, episode: scoring.episode, scoring_type: scoring.scoring_type, canonical_id: scoring.id)
      end
    end
  end
end
