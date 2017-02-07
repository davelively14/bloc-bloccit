require 'random_data'

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

post = Post.find_or_create_by(title: "An idempotent tail", body: "Just once. That's all.")
Comment.find_or_create_by(body: "Unique body for my idempotent post", post: post)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
