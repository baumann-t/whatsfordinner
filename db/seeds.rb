User.destroy_all
Recipe.destroy_all
UserRecipe.destroy_all

puts "Creating users"

15.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 123456,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    location: Faker::Address.city
  )

  user.save!
  puts user.first_name
end

puts "Creating recipes"

50.times do
  recipe = Recipe.new(
    title: Faker::Food.dish,
    description: Faker::Food.description,
    ingredients: "#{Faker::Food.ingredient},#{Faker::Food.measurement}, #{Faker::Food.ingredient}, #{Faker::Food.measurement}",
    prep_time: "#{Faker::Number.between(from: 1, to: 10)} hours",
    instructions: "Cook the #{Faker::Food.ingredient} on #{["high", "low", "medium"]} during 10 minutes. Add the #{Faker::Food.spice}. Bake for #{Faker::Number.between(from: 1, to: 10)} hours. Then add #{Faker::Food.measurement} of #{Faker::Food.spice}. Prepare the #{Faker::Food.fruits} for dessert"
  )
  user = User.all.to_a.sample
  recipe.user = user
  recipe.save!
  puts recipe.title
end

puts "Creating user_recipes"


50.times do
  user = User.all.to_a.sample
  recipe = Recipe.all.to_a.sample
  user_recipe = UserRecipe.new(
    cooked: [false, true].sample,
    date_cooked: Faker::Date.in_date_period(year: 2018, month: 2),
    whishlisted: [false, true].sample,
  )

  user_recipe.user = user
  user_recipe.recipe = recipe
  user_recipe.save!
end
