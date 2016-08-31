class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :answerer, class_name: "User"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
end
