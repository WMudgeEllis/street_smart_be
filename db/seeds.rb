# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vote.destroy_all
Hazard.destroy_all
User.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

user1 = User.create(email: 'admin@admin.com')
user2= User.create(email: 'bummer@bummmer.com')
hazard1 = user1.hazards.create!(title: "Cheyenne, Wyoming", description: "Je suis comme je suis", latitude: "41.1400", longitude: "-104.8202", category: 0)
hazard2 = user1.hazards.create!(title: "North Pole, Alaska", description: "Je suis fait comme ça", latitude: "64.7511", longitude: "-147.3494", category: 1)
hazard3 = user1.hazards.create!(title: "Parking Lot", description: "is super sketch", latitude: "41.137859", longitude: "-104.766779", category: 1)
hazard4 = user1.hazards.create!(title: "Big 'ol pothole", description: "Like SUPER big", latitude: "41.143200", longitude: "-104.772970", category: 1)

Vote.create!(hazard_id: hazard1.id, upvote: 10, downvote: 1)
Vote.create!(hazard_id: hazard2.id, upvote: 10, downvote: 1)
Vote.create!(hazard_id: hazard3.id, upvote: 10, downvote: 1)
Vote.create!(hazard_id: hazard4.id, upvote: 10, downvote: 1)

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
