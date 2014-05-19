
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)

def create_user name, counter = nil
  user = User.new(email: "example@example.com#{counter}",
    role: :user,
    sex: :male,
    name: name,
    password: 'password',
    password_confirmation: 'password')
  user.skip_confirmation!
  user.save!
end

[
  'Batman',
  'Batgirl',
  'Flash',
  'Superman',
  'Aquaman',
  'Nightwing'
].each_with_index do |name, i|
  create_user(name, i)
end

create_user('Джон Уэин')

users = User.all
(15 * 10).times do |index|
  file = if File.exists? File.join(Rails.root, "/db/images/#{index % 40}.jpg")
           File.open(File.join(Rails.root, "/db/images/#{index % 40}.jpg"))
         else
           File.open(File.join(Rails.root, "/db/images/#{index % 40}.png"))
         end
  Picture.create name: "Test_#{index}", path: file, user: users.sample
end

Picture.all.find_each do |picture|
  (0..2).to_a.sample.times do |counter|
    picture.comments.create(user_id: users.sample, text: "Example comment #{counter}", commentable_id: picture.id, commentable_type: 'Picture')
  end
end
