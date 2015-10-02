module ScoreBreakdown
  extend ActiveSupport::Concern

  def scores_by_episode
    result = @scorings.group_by(&:episode_id)
    result.each do |episode, scorings|
      result[episode] = scorings.inject(0) { |total, scoring| total + scoring.value }
    end
  end

  def scorings_by_episode_and_scoring_type
    result = @scorings.group_by(&:episode_id)
    result.each do |episode, scorings|
      result[episode] = scorings.group_by(&:scoring_type_id)
    end
  end

end
