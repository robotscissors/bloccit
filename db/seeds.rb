require 'random_data'

#create posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

#Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#Create Unique Post
uniquePost = Post.find_or_create_by!(
  title: "This is Christopher's Post",
  body: "Today is the first day of the rest of your life!"
)

#Create a unique Comment
Comment.find_or_create_by!(
  post: uniquePost,
  body: "This is another day!!"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
