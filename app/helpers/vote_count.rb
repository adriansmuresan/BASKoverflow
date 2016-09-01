module VoteCount
  def vote_sum
    total_vote = 0
    self.votes.each do |vote|
      total_vote += vote.value
    end
    total_vote
  end
end
helpers VoteCount
