
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
  # Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(email: 'example@example.com', role: :user, name: 'example', password: 'password', password_confirmation: 'password')
user.skip_confirmation!
user.save!


(15 * 5).times do |index|
  Picture.create name: "Test_#{index}", path: File.open(File.join(Rails.root, "/db/images/#{index % 15}.jpg")), user_id: User.first.id
end
