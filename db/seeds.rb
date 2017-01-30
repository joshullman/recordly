# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "guest@aol.com", password: "password")

artist = Artist.create(name: "Sloopowerps")
album_one = Album.create(title: "Dungalo", artist_id: artist.id)
album_two = Album.create(title: "Meera", artist_id: artist.id)

Song.create(title: "alskjdfkj", album_id: album_one.id, track_num: 1)
Song.create(title: "fds", album_id: album_one.id, track_num: 2)
Song.create(title: "lsjhkd", album_id: album_one.id, track_num: 3)
Song.create(title: "mjhiuh", album_id: album_two.id, track_num: 1)
Song.create(title: "iudhfb", album_id: album_two.id, track_num: 2)
Song.create(title: "dgkjshdf", album_id: album_two.id, track_num: 3)