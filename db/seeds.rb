20.times do
 Question.create({
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    author_id: rand(1..10)
  })
end
