# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lineitem.delete_all
Product.delete_all
Customer.delete_all
Photo.delete_all
Order.delete_all

# #Generating users

customer1 = Customer.create!(:name=>"Sri", :email => "sri@gmail.com", :password =>"password")
customerAdmin = Customer.create!(:name=>"Admin", :email => "admin@gmail.com", :password =>"adminpassword")

ProductMugs = Product.create!(:name=>"Coffee Mugs", :description=>"Amazing coffee mugs with your photos on them!", :current_price=>500, :example_url=>"/assets/mugsINIT.jpg")
ProductTshirts = Product.create!(:name=>"T-shirts ", :description=>"Amazing tshirts with your photos on them!", :current_price=>1000,:example_url=>"/assets/tshirtsINIT.jpg")
ProductPosters = Product.create!(:name=>"Posters", :description=>"Cool Posters for your walls!", :current_price=>2000, :example_url=>"/assets/postersINIT.jpg")
ProductButtons = Product.create!(:name=>"Buttons", :description=>"Amazing buttons with your photos on them!", :current_price=>2200, :example_url=>"/assets/buttonsINIT.jpg")
ProductMagnets = Product.create!(:name=>"Magnets", :description=>"Insipring magnets for your fridge?", :current_price=>2005, :example_url=>"/assets/magnetsINIT.jpg")
ProductCards = Product.create!(:name=>"Cards", :description=>"Customizable namecards are a go", :current_price=>200, :example_url=>"/assets/cardsINIT.jpg")
ProductJumpers = Product.create!(:name=>"Jumpers", :description=>"Buy now for the winter season", :current_price=>500, :example_url=>"/assets/jumpersINIT.jpg")
# ProductJumpers = Product.create!(:name=>"Jumpers", :description=>"Buy now for the winter season", :current_price=>500, :example_url=>"/assets/jumpersINIT.jpg")


[customer1, customerAdmin].each(&:skip_confirmation!).each(&:save!)
