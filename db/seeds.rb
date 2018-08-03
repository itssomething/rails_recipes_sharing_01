
5.times do
  name = Faker::Name.name
  User.create(name: name, email: Faker::Internet.free_email(name),
    address: Faker::Address.full_address,
    avatar: Faker::Avatar.image,
    password: "danhmanh")
end

# Category.destroy_all
# name_category = ["Ăn sáng", "Ăn vặt", "Khai vị", "Món chay", "Món chính", "Lẩu",
#   "Làm Bánh", "Bún - Mì - Phở", "Thức uống", "Salad", "Snacks", "Nước chấm"]

# name_category.each do |cate|
#   name = cate
#   Category.create!(name: name)
# end

# Recipe.destroy_all
20.times do
  Recipe.create(name: Faker::Food.dish,
    description: Faker::Food.description,
    user_id: Faker::Number.between(1, 5),
    cover_photo: Faker::LoremFlickr.image("175x175")
    )
end



