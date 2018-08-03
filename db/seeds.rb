# User.destroy_all

50.times do
  name = Faker::Name.name
  User.create(name: name, email: Faker::Internet.free_email(name),
    address: Faker::Address.full_address,
    password: "123456")
end
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
# user  = users.last
# following = users[1..3]
# followers = users[1..3]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

#  Category.destroy_all
name_category = ["Ăn sáng", "Ăn vặt", "Khai vị", "Món chay", "Món chính", "Lẩu", "Làm Bánh", "Bún - Mì - Phở", "Thức uống", "Salad", "Snacks", "Nước chấm"]

name_category.each do |cate|
  name = cate
  Category.create!(name: name)
end

Recipe.create(name: Faker::Food.dish,
  description: Faker::Food.description,
  user_id: 101,
  cover_photo: Faker::LoremFlickr.image("800x500"),
  purpose: "Ăn lúc đi ngủ",
  ready_in: 12,
  difficult_level: "Khó",
  )

60.times do
  Step.create!(recipe_id:  Faker::Number.between(1, 20),
  content: Faker::Food.description)
end

10.times do
  RecipeIngredient.create!(amount: Faker::Number.between(1, 10) ,
  measurement: "kg", recipe_id: Faker::Number.between(1, 20),
  ingredient_name: Faker::Food.ingredient)
end


5.times do
  Step.create!(recipe_id: 1, content: Faker::Food.description)
end
Recipe.destroy_all
40.times do
  Recipe.create(name: Faker::Food.dish,
    description: Faker::Food.description,
    purpose: "mục đích",
    ready_in: Faker::Number.between(10,30),
    difficult_level: "khó",
    user_id: Faker::Number.between(1,4),
    people_num: Faker::Number.between(1,5),
    cover_photo: Faker::LoremFlickr.image("200x200")
    )
end

50.times do
  CategoryRecipe.create(
    category_id: Faker::Number.between(1,12),
    recipe_id: Faker::Number.between(61,100)
    )
  end

10.times do
  RecipeIngredient.create!(amount: Faker::Number.between(1, 10) , measurement: "kg", recipe_id: 1, ingredient_name: Faker::Food.ingredient)
end
