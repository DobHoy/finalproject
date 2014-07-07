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

ProductMugs = Product.create!(:name=>"Coffee Mugs", :description=>"Amazing coffee mugs with your photos on them!", :current_price=>100, :example_url=>"/assets/mugsINIT.jpg")
ProductTshirts = Product.create!(:name=>"T-shirts ", :description=>"Amazing tshirts with your photos on them!", :current_price=>50,:example_url=>"/assets/tshirtsINIT.jpg")
ProductButtons = Product.create!(:name=>"buttons", :description=>"Amazing buttons with your photos on them!", :current_price=>200, :example_url=>"/assets/buttonsINIT.jpg")

[customer1, customerAdmin].each(&:skip_confirmation!).each(&:save!)

# user2 = User.new(:first_name=>"Yasmin", :last_name => "Razavi", :remote_avatar_url => "https://scontent-a-lhr.xx.fbcdn.net/hphotos-xpa1/t1.0-9/10341937_10201334716164102_507462187152992426_n.jpg", :email => "yasmin@gmail.com", :password =>"password", :role => "user")
# user3 = User.new(:first_name=>"Sri", :last_name => "Mohan", :remote_avatar_url => "https://avatars2.githubusercontent.com/u/5783383?s=400", :email => "sri@gmail.com", :password =>"password", :role => "user")
# user4 = User.new(:first_name=>"Liz", :last_name => "Smith", :remote_avatar_url => "http://www.thewellingtonplasticsunit.com/images/side2.jpg", :email => "liz@gmail.com", :password =>"password", :role => "user")
# user5 = User.new(:first_name=>"Bob", :last_name => "Jones", :remote_avatar_url => "http://www.brocku.ca/brock-news/wp-content/uploads/cache/3395_NpAdvHover.jpg", :email => "bob@gmail.com", :password =>"password", :role => "user")
# user6 = User.new(:first_name=>"Daisy", :last_name => "Simmons", :email => "daisy@gmail.com", :password =>"password", :role => "user", :bio => "I really just love collecting stuff.")
# user7 = User.new(:first_name=>"Ed", :last_name => "Woodward", :email => "ed@gmail.com", :password =>"password", :role => "user", :bio => "My passion is sharing photos.")
# sriUserMatt = User.new(:first_name=>"Matt", :last_name => "Smith",:remote_avatar_url => "http://upload.wikimedia.org/wikipedia/en/2/28/Deep_Fried_Man_portrait_-_real_name_Daniel_Friedman_-_South_African_Comedian.jpg", :email => "matt@gmail.com", :password =>"password", :role => "user", :bio => "I love collecting vintage vinyl")
# sriUserLisa = User.new(:first_name=>"Lisa", :last_name => "Andrews",:remote_avatar_url => "http://10ambeauty.com/wp-content/uploads/2013/01/Wearing-NARS-And-God-Created-The-Woman.jpg", :email => "lisa2@gmail.com", :password =>"password", :role => "user", :bio => "Flowers are amazing")

# [user1, user2, user3, user4, user5, user6, user7, sriUserMatt, sriUserLisa].each(&:skip_confirmation!).each(&:save!)
