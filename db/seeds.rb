# User.destroy_all

# 50.times do
#   name = Faker::Name.name
#   User.create(name: name, email: Faker::Internet.free_email(name),
#     address: Faker::Address.full_address,
#     avatar: Faker::Avatar.image,
#     password: "danhmanh")
# end
# User.create!(name:  "Danh Manh ahihi",
#   email: "example@railstutorial.org",
#   password:              "foobar",
#   password_confirmation: "foobar",
#   admin:     true
# )

# 99.times do |n|
# name  = Faker::Name.name
# email = "example-#{n+1}@railstutorial.org"
# password = "password"
# User.create!(name:  name,
#     email: email,
#     password:              password,
#     password_confirmation: password,
# )
# end

# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

# Category.destroy_all
# name_category = ["Ăn sáng", "Ăn vặt", "Khai vị", "Món chay", "Món chính", "Lẩu", "Làm Bánh", "Bún - Mì - Phở", "Thức uống", "Salad", "Snacks", "Nước chấm"]

# name_category.each do |cate|
#   name = cate
#   Category.create!(name: name)
# end

Recipe.create(name: Faker::Food.dish,
  description: Faker::Food.description,
  user_id: 101,
  cover_photo: Faker::LoremFlickr.image("800x500"),
  purpose: "Ăn lúc đi ngủ",
  ready_in: 12,
  difficult_level: "Khó",
  )


5.times do
  Step.create!(recipe_id: 1, content: Faker::Food.description)
end
# Recipe.all.each(&:delete)
# 20.times do
#   Recipe.create(name: Faker::Food.dish,
#     description: Faker::Food.description,
#     purpose: "mục đích",
#     ready_in: Faker::Number.between(10,30),
#     difficult_level: "khó",
#     user_id: Faker::Number.between(1, 5),
#     cover_photo: Faker::LoremFlickr.image("200x200")
#     )
# end

10.times do
  RecipeIngredient.create!(amount: Faker::Number.between(1, 10) , measurement: "kg", recipe_id: 1, ingredient_name: Faker::Food.ingredient)
end




