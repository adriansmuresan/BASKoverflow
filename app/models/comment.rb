class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many   :votes, as: :votable


  def vote_total
    self.votes.sum(:value)
  end

end
