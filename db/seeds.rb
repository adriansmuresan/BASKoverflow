20.times do
 Question.create({
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    author_id: rand(1..10)
  })
end

100.times do
  Answer.create({
    description: Faker::Lorem.paragraph,
    question_id: rand(1..20),
    answerer_id: rand(1..10)
    })
end

200.times do
  Vote.create({
      value: rand(-1..1),
      votable_id: rand(1..20),
      votable_type: 'Question',
      votable_id: rand(1..10)
    })
end

200.times do
  Vote.create({
      value: rand(-1..1),
      votable_id: rand(1..100),
      votable_type: 'Answer',
      votable_id: rand(1..10)
    })
end

200.times do
  Vote.create({
      value: rand(-1..1),
      votable_id: rand(1..400),
      votable_type: 'Comment',
      votable_id: rand(1..10)
    })
end

10.times do
  User.create({
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password123'
    })
end

200.times do
  Comment.create({
    content: Faker::Lorem.paragraph,
    commentable_id: rand(1..20),
    commentable_type: 'Question',
    commenter_id: rand(1..10)
    })
end

200.times do
  Comment.create({
    content: Faker::Lorem.paragraph,
    commentable_id: rand(1..20),
    commentable_type: 'Answer',
    commenter_id: rand(1..10)
    })
end
