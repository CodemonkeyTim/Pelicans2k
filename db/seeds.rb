# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(f_name: "Teemu", l_name: "Vainio", email: "vaintee1@lpt.fi", password: "Tvaini0", password_confirmation: "Tvaini0", role: "admin")
User.create(f_name: "Tauno", l_name: "Liuksiala", email: "tliuksiala@lpt.fi", password: "tilukset", password_confirmation: "tilukset", role: "head_coach")
User.create(f_name: "Minh", l_name: "Swostik", email: "minho@lpt.fi", password: "english", password_confirmation: "english", role: "team_leader")
