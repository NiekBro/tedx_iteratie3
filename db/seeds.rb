# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!([
	{
		:name => "Quido Hoekman",
		:email => "quido@qhoekman.nl",
		:avatar => "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash4/c170.50.621.621/s160x160/487062_474066185960675_1760798499_n.jpg"
	},
	{
		:name => "Robin van Norel",
		:email => "robinhood953@hotmail.com",
		:avatar => "https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-snc6/266187_4274198618308_395103412_o.jpg"
	}
])
Blogpost.create!([
	{
		:title => "Hello World",
		:body => "Dit is een test!",
		:user_id => User.first.id
	}
])