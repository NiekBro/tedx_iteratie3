# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hookups = Hookup.create!([
	{
		:name => "DiaBETER",
		:description => "Patientvereniging waarin je gehoord wordt!"
	}
])
diseases = Disease.create!([
	{
		:hookup_id => Hookup.first.id,
		:name => "Diabetes"
	}
])

users = User.create!([
	{
		:name => 'Quido Hoekman',
		:email => "quido@qhoekman.nl",
		:avatar => "http://www.avatarhosting.net/pics/2719/ben_elton.jpg",
		:hookup_id => Hookup.first.id
	}
])