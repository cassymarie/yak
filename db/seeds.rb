# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

me = User.create(email:'Cassy@email.com', password: 'password')
you = User.create(email:'Steve@email.com', password: 'password')

p1 = Player.create(name:'Stephen Ortiz', position: '3B', status:'A', jersey_number:5)
p2 =Player.create(name:'Ronald Acuna Jr', position: 'OF', status:'A', jersey_number:13)
p3 = Player.create(name:'Freddie Freeman', position: '1B', status:'A', jersey_number:5)
p4 = Player.create(name:'John Smith', position: 'SS', status:'A', jersey_number:99)
p5 = Player.create(name:'Brian McCann', position: 'C', status:'R', jersey_number:23)
p6 = Player.create(name:'Chipper Jones', position: '3B', status:'R', jersey_number:10)

Team.create(mlb_team_id:'144', custom_team: false, C_id: p5.id, B3_id: p1.id, OF1_id: p2.id, B1_id: p3.id, SS_id: p4.id, user_id: me.id)
Team.create(custom_team: true, C_id: p5.id, B3_id: p6.id, OF2_id: p2.id, B1_id: p3.id, SS_id: p4.id, user_id: you.id)
