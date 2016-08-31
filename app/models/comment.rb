class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many   :votes, as: :votable

  def vote_sum
    total_vote = 0
    self.votes.each do |vote|
      total_vote += vote.value
    end
    total_vote
  end
end
