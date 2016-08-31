class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def vote_sum
    total_vote = 0
    self.votes.each do |vote|
      total_vote += vote.value
    end
    total_vote
  end
end
