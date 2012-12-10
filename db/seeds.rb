# encoding: UTF-8

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


Team.create(name: "A Junnut", code: "A-juniorit")
Team.create(name: "B Junnut", code: "B-juniorit")
Team.create(name: "C2 -98", code: "C2")
Team.create(name: "C2 Team", code: "C2 Team")
Team.create(name: "D1 -99 TEHO", code: "D1")

Reservation.create(starts_at: "9:30", team_id: 1, activity: "Jääaika", date: Date.new(2012, 11, 27))
Reservation.create(starts_at: "10:00", team_id: 1, activity: "Jääaika", date: Date.new(2012, 11, 27))
Reservation.create(starts_at: "10:30", team_id: 1, activity: "Jääaika", date: Date.new(2012, 11, 27))

Reservation.create(starts_at: "11:00", team_id: 2, activity: "Jääaika", date: Date.new(2012, 11, 27))
Reservation.create(starts_at: "11:30", team_id: 2, activity: "Jääaika", date: Date.new(2012, 11, 27))

Reservation.create(starts_at: "12:00", team_id: 3, activity: "Jääaika", date: Date.new(2012, 11, 27))
Reservation.create(starts_at: "12:30", team_id: 3, activity: "Jääaika", date: Date.new(2012, 11, 27))

News.create(title: "Uutinen 1", body: "Tämä on tekstiosio uutiselle numero 1.", published_at: (DateTime.now - 5), publisher_id: 1)
News.create(title: "Uutinen 2", body: "Tämä on tekstiosio uutiselle numero 2 ja vähän erilainen kuin uutinen 1.", published_at: (DateTime.now - 7), publisher_id: 2)
News.create(title: "Uutinen 3", body: "Tämä on tekstiosio uutiselle numero 3 joka olisi muuten samanlainen kuin uutinen 1 mutta se ei ole.", published_at: (DateTime.now - 8), publisher_id: 1)
News.create(title: "Uutinen 4", body: "Tämä on tekstiosio uutiselle numero 4 jonka jälkeen tulee vielä uutinen 5.", published_at: (DateTime.now - 10), publisher_id: 1)
News.create(title: "Uutinen 5", body: "Tämä on tekstiosio uutiselle numero 5 joka on viimeinen uutinen.", published_at: (DateTime.now - 12), publisher_id: 2)

Player.create(f_name: "Swostik", l_name: "Shrestra", number: 1, position: "keskushyökkääjä", team_id: 1)
Player.create(f_name: "Minh", l_name: "Nhat", number: 3, position: "vasen laitahyökkääjä", team_id: 1)
Player.create(f_name: "Trung", l_name: "Hoang", number: 55, position: "oikea laitahyökkääjä", team_id: 1)
Player.create(f_name: "Antti", l_name: "Jääskeläinen", number: 34, position: "puolustaja", team_id: 1)
Player.create(f_name: "Mara", l_name: "Tuominen", number: 65, position: "puolustaja", team_id: 1)
Player.create(f_name: "Pentti", l_name: "Tikanoja", number: 23, position: "puolustaja", team_id: 1)

StaffMember.create(f_name: "Olli", l_name: "Orava", role: "valmentaja", email: "oorava@gmail.com", phone: "044-5552244", team_id: 1)
StaffMember.create(f_name: "Terppi", l_name: "Terävä", role: "kahvittaja", email: "terppitee@gmail.com", phone: " 045-78922312", team_id: 1)
StaffMember.create(f_name: "Ilkka", l_name: "Ilves", role: "varustevastaava", email: "iilves@gmail.com", phone: "0400-3453451", team_id: 1)
StaffMember.create(f_name: "Pekka", l_name: "Pakorauta", role: "teroittaja", email: "peepako@gmail.com", phone: "044-1122113", team_id: 1)
StaffMember.create(f_name: "Timo", l_name: "Tiira", role: "vastaava mestari", email: "mest@ari.fi", phone: "044-9999999", team_id: 1)
