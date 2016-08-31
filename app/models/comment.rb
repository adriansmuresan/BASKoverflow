class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true
  has_many   :votes, as: :votable
end
