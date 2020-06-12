# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..10).each do |number|
	user = User.new(:name => 'test' + number.to_s, :email => 'test' + number.to_s + '@test.com', :password => 'testtest')
	user.save!
  # User.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s)
end