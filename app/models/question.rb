class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable
  has_many :answers
  has_many :comments, as: :commentable

  def vote_sum
    total_vote = 0
    self.votes.each do |vote|
      total_vote += vote.value
    end
    total_vote
  end
end
