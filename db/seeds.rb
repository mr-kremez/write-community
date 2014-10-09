# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:email => 'maks@gmai.com', :username => 'Maks', :password => '1q2w3e4r')
User.create(:email => 'dima@gmai.com', :username => 'Dima', :password => '1q2w3e4r')

Category.create(:name => "Since")
Category.create(:name => "Nature")
Category.create(:name => "IT")
Category.create(:name => "Society")

25.times do |i|
	Book.create(:name => "Book #{i}", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel tincidunt metus, eu lobortis odio. Duis ipsum lorem, fringilla vitae euismod vitae, eleifend ultricies velit. Nam maximus nunc eu pharetra facilisis. In fringilla felis volutpat ex lacinia dignissim. Quisque nec metus eu justo mattis molestie. Suspendisse egestas nunc nec ipsum aliquet laoreet. Quisque dignissim dui quis lectus fermentum, non varius justo cursus. Nam vel lorem sed lectus interdum auctor. Mauris porttitor neque purus, in lacinia enim ultricies eget. Curabitur in lacus est. Vestibulum eu fringilla nulla.", 
		:category_id => rand(1..4), :user_id  => rand(1..2))
end