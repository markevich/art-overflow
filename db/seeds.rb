
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'example@example.com', role: :user, first_name: 'bruce', last_name: 'wayne', nickname: 'batman', password: 'password', password_confirmation: 'password')
user.skip_confirmation!
user.save!

AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')


(15 * 5).times do |index|
  Picture.create name: "Test_#{index}", path: File.open(File.join(Rails.root, "/db/images/#{index % 15}.jpg")), user_id: User.first.id
end

Picture.all.find_each do |picture|
  5.times do |counter|
    picture.comments.create(user_id: User.first.id, text: "Example comment #{counter}", commentable_id: picture.id, commentable_type: 'Picture')
  end
end
