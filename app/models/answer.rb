class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates_presence_of :description

  def vote_total
    self.votes.sum(:value)
  end

end
