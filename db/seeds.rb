# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


posts = []

20.times do
  posts.push(Post.create(title: Faker::Book.title, content: Faker::Lorem.sentence(word_count: 50), author_name: Faker::Name.name))
end

20.times do
  Comment.create(post_id: posts.sample.id, commenter_name: Faker::Name.name, content: Faker::Lorem.sentence(word_count: 40))
end

# Post.create(title: "test", content: "test", author_name: "testtest")
