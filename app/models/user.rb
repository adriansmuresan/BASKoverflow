class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user != nil ? user.password == password : false
  end

end
