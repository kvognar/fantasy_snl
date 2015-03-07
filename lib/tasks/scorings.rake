namespace :scorings do
  task :transfer_scorings => :environment do
    desc 'creates scorings for teams based on actor scorings'
    Team.includes(members: [scorings: :scoring_type]).all.each do |team|
      team.members.each do |actor|
        actor.scorings.each do |scoring|
          team.scorings << Scoring.create(actor: actor, episode: scoring.episode, scoring_type: scoring.scoring_type)
        end
      end
    end
  end
end
