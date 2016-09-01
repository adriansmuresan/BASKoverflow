class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable
  has_many :answers
  has_many :comments, as: :commentable

  validates_presence_of :title
  validates_uniqueness_of :title


  def vote_total
    self.votes.sum(:value)
  end
end
