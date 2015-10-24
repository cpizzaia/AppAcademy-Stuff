# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(username: 'ben', password: 'benben')
u2 = User.create!(username: 'cody', password: 'codycody')
s1 = Sub.create!(title: "cats", description: "a sub for cats", moderator_id: 1)
s2 = Sub.create!(title: "lolcode", description: "a sub for lolcode", moderator_id: 2)

p1 = Post.create!(title: "Cats are great", content: "yeah cats", author_id: u2.id)
p2 = Post.create!(title: "lolcode is great", content: "lololololcode", author_id: u1.id)

ps1 = PostSub.create!(sub_id: s1.id, post_id: p1.id)
ps2 = PostSub.create!(sub_id: s2.id, post_id: p2.id)
