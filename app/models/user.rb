class User < ActiveRecord::Base
  before_destroy :destroy_all_records

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validate :password_length_check

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @plaintext_pass = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate?(email, password)
    user = User.find_by(email: email)
    user != nil ? user.password == password : false
  end

  def total_votes
    total = 0
    self.questions.each do |question|
      total += question.votes.sum(:value)
    end
    self.answers.each do |answer|
      total += answer.votes.sum(:value)
    end
    self.comments.each do |comment|
      total += comment.votes.sum(:value)
    end
    total
  end

  def password_length_check
    if @plaintext_pass.length < 8
      errors.add(:password, "must be at least 8 characters")
    end
  end

  private
  def destroy_all_records
    self.questions.destroy_all
    self.comments.destroy_all
    self.answers.destroy_all
    self.votes.destroy_all
  end

end
