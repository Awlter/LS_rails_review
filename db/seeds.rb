# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

show = Category.create(name: 'TV show')
drama = Category.create(name: 'Drama')

futurama = Video.create(title: 'Futurama', description: 'Futurama is very fun', small_cover_url: 'futurama.jpg', large_cover_url: 'monk.jpg', category_id: drama.id)
family_guy = Video.create(title: 'Family Guy', description: 'Family guy is very touching', small_cover_url: 'family_guy.jpg', large_cover_url: 'monk_large.jpg', category_id: drama.id)
monk = Video.create(title: 'Monk', description: 'Monk is very tough', small_cover_url: 'monk.jpg', large_cover_url: 'monk_large.jpg', category_id: drama.id)
south_park = Video.create(title: 'South Park', description: 'South part is very dirty', small_cover_url: 'south_park.jpg', large_cover_url: 'monk_large.jpg', category_id: drama.id)
futurama = Video.create(title: 'Futurama', description: 'Futurama is very fun', small_cover_url: 'futurama.jpg', large_cover_url: 'monk.jpg', category_id: drama.id)
family_guy = Video.create(title: 'Family Guy', description: 'Family guy is very touching', small_cover_url: 'family_guy.jpg', large_cover_url: 'monk_large.jpg', category_id: drama.id)
monk = Video.create(title: 'Monk', description: 'Monk is very tough', small_cover_url: 'monk.jpg', large_cover_url: 'monk_large.jpg', category_id: drama.id)

monk = Video.create(title: 'Monk', description: 'Monk is very tough', small_cover_url: 'monk.jpg', large_cover_url: 'monk_large.jpg', category_id: show.id)
south_park = Video.create(title: 'South Park', description: 'South part is very dirty', small_cover_url: 'south_park.jpg', large_cover_url: 'monk_large.jpg', category_id: show.id)

walter = User.create(full_name: "Walter Wang", email: 'wxfwalter@gmail.com', password: 'password')
riddle = User.create(full_name: "Riddle Bear", email: 'riddlebear@gmail.com', password: 'password')

walter_monk_review = Review.create(content: "This show is really is time killer", rating: 5, video: monk, user: walter)
riddle_monk_review = Review.create(content: "I don't know why I wasted my whole weekend for this show..", rating: 3, video: monk, user: riddle)

walter_south_park_review = Review.create(content: "The time killer is this show", rating: 4, video: south_park, user: walter)
QueueItem.create(user: walter, video: monk, position: 1)
QueueItem.create(user: walter, video: south_park, position: 2)
QueueItem.create(user: riddle, video: monk, position: 1)