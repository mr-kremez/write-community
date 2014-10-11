# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(:email => 'maks@gmail.com', :username => 'Maks', :password => '1q2w3e4r')
User.create(:email => 'dima@gmail.com', :username => 'Dima', :password => '1q2w3e4r')

Category.create(:name => "Since")
Category.create(:name => "Nature")
Category.create(:name => "IT")
Category.create(:name => "Society")

50.times do |i|
	Book.create(:name => "Book #{i + 1}", :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vel tincidunt metus, eu lobortis odio. Duis ipsum lorem, fringilla vitae euismod vitae, eleifend ultricies velit. Nam maximus nunc eu pharetra facilisis. In fringilla felis volutpat ex lacinia dignissim. Quisque nec metus eu justo mattis molestie. Suspendisse egestas nunc nec ipsum aliquet laoreet. Quisque dignissim dui quis lectus fermentum, non varius justo cursus. Nam vel lorem sed lectus interdum auctor. Mauris porttitor neque purus, in lacinia enim ultricies eget. Curabitur in lacus est. Vestibulum eu fringilla nulla.", 
		:category_id => rand(1..4), :user_id  => rand(1..2))
end

10.times do |i|
	Chapter.create(:name => "Chapter #{i + 1}", :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sollicitudin ante. Duis faucibus diam sollicitudin, porta mi vitae, viverra nibh. Mauris sed porttitor felis, a malesuada arcu. Ut vitae lectus vel mi tincidunt tincidunt. Cras id diam egestas orci hendrerit sagittis. Fusce ultrices consequat quam, at malesuada leo viverra vel. Ut pharetra id lectus nec consequat. Morbi sed eleifend dui. Etiam faucibus molestie turpis, nec facilisis leo maximus eu. Donec maximus ac risus ut dictum. Suspendisse sed dapibus felis, non laoreet nunc.

Integer ac feugiat urna. Praesent vitae sapien lacus. Praesent dapibus lorem velit, at rutrum augue sodales at. Suspendisse suscipit libero ut urna maximus, sit amet aliquam nisl vulputate. Cras quis placerat neque. Vestibulum pellentesque rhoncus purus, vitae pellentesque lectus. Nulla facilisi. Pellentesque ac elit neque. Donec nisl magna, consectetur sollicitudin quam ac, dapibus egestas odio. Nunc semper felis nec diam consectetur mattis.

Aliquam feugiat euismod leo, et hendrerit urna scelerisque non. Praesent pretium porta mauris quis dapibus. Fusce nec augue nisi. Nulla ullamcorper ultrices auctor. Mauris non arcu eleifend, cursus dui vitae, aliquet odio. Ut tempus non eros eu eleifend. Donec ac dolor vestibulum, rutrum ex et, malesuada quam. Donec luctus dictum est, et consequat dolor feugiat sed. Donec pretium sed velit sed aliquet.

Praesent tempor ligula in eros cursus, vel porttitor magna fringilla. Nunc tellus nulla, rhoncus vitae eros non, fringilla sagittis diam. Sed eu odio a arcu pulvinar consectetur eget ut sem. Nullam in mi imperdiet, blandit enim ut, egestas libero. Quisque ultrices mauris nec tellus tempus, a posuere odio tempus. Nunc semper vitae orci in venenatis. Ut dignissim nibh non justo feugiat, nec dictum turpis rhoncus. Suspendisse potenti. Donec vitae est at elit suscipit mollis. Cras sed pharetra nisl, ut finibus justo. Donec vulputate augue eu ipsum tristique congue. Aliquam fringilla ultrices nulla, id blandit mi eleifend eget.

Phasellus laoreet lacus sed lacus venenatis, vehicula tincidunt est porttitor. Vestibulum dignissim ante et mauris tincidunt, sed pharetra libero imperdiet. Integer euismod semper dui. Nam sollicitudin lectus dolor, at tincidunt diam ullamcorper sit amet. Maecenas justo massa, dictum sed tellus vitae, tempus accumsan massa. Mauris egestas ac mauris in ultricies. In rhoncus ante sit amet mattis interdum. Mauris fermentum, odio id maximus dictum, leo tortor sagittis dui, quis lacinia elit ex nec mauris. Proin fermentum egestas leo a elementum.

",
		:book_id => 1)
end
10.times do |i|
	Chapter.create(:name => "Chapter #{i + 1}", :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et sollicitudin ante. Duis faucibus diam sollicitudin, porta mi vitae, viverra nibh. Mauris sed porttitor felis, a malesuada arcu. Ut vitae lectus vel mi tincidunt tincidunt. Cras id diam egestas orci hendrerit sagittis. Fusce ultrices consequat quam, at malesuada leo viverra vel. Ut pharetra id lectus nec consequat. Morbi sed eleifend dui. Etiam faucibus molestie turpis, nec facilisis leo maximus eu. Donec maximus ac risus ut dictum. Suspendisse sed dapibus felis, non laoreet nunc.

Integer ac feugiat urna. Praesent vitae sapien lacus. Praesent dapibus lorem velit, at rutrum augue sodales at. Suspendisse suscipit libero ut urna maximus, sit amet aliquam nisl vulputate. Cras quis placerat neque. Vestibulum pellentesque rhoncus purus, vitae pellentesque lectus. Nulla facilisi. Pellentesque ac elit neque. Donec nisl magna, consectetur sollicitudin quam ac, dapibus egestas odio. Nunc semper felis nec diam consectetur mattis.

Aliquam feugiat euismod leo, et hendrerit urna scelerisque non. Praesent pretium porta mauris quis dapibus. Fusce nec augue nisi. Nulla ullamcorper ultrices auctor. Mauris non arcu eleifend, cursus dui vitae, aliquet odio. Ut tempus non eros eu eleifend. Donec ac dolor vestibulum, rutrum ex et, malesuada quam. Donec luctus dictum est, et consequat dolor feugiat sed. Donec pretium sed velit sed aliquet.

Praesent tempor ligula in eros cursus, vel porttitor magna fringilla. Nunc tellus nulla, rhoncus vitae eros non, fringilla sagittis diam. Sed eu odio a arcu pulvinar consectetur eget ut sem. Nullam in mi imperdiet, blandit enim ut, egestas libero. Quisque ultrices mauris nec tellus tempus, a posuere odio tempus. Nunc semper vitae orci in venenatis. Ut dignissim nibh non justo feugiat, nec dictum turpis rhoncus. Suspendisse potenti. Donec vitae est at elit suscipit mollis. Cras sed pharetra nisl, ut finibus justo. Donec vulputate augue eu ipsum tristique congue. Aliquam fringilla ultrices nulla, id blandit mi eleifend eget.

Phasellus laoreet lacus sed lacus venenatis, vehicula tincidunt est porttitor. Vestibulum dignissim ante et mauris tincidunt, sed pharetra libero imperdiet. Integer euismod semper dui. Nam sollicitudin lectus dolor, at tincidunt diam ullamcorper sit amet. Maecenas justo massa, dictum sed tellus vitae, tempus accumsan massa. Mauris egestas ac mauris in ultricies. In rhoncus ante sit amet mattis interdum. Mauris fermentum, odio id maximus dictum, leo tortor sagittis dui, quis lacinia elit ex nec mauris. Proin fermentum egestas leo a elementum.

",
		:book_id => 2)
end