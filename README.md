# README

Alright, I've reached a bit of a pivot point.  There's two directions I can take that depend on the desired user experience:

![alt text](/app/assets/images/image2.JPG "Nested Routes")

1. Users are able to create, edit, and destroy Artists, Albums, and Songs directly from the database.  This puts control in the hands of the User.  The User would manually have to add Artists, Albums, and Songs and the User would essentially own all three of these.  In this scenario I would use nested routes (users/:id/artists, users/:id/albums, etc) because every user's record collection is entirely owned by them.  I think this creates more drawbacks than benefits, but it depends on your anticipated user base.  Users would have more control but it would mean they would end up having to manually input every single Artist, Album, and Song which could take a ton of time.  It would also take up much more room in the database because every User that enters "The White Album" would be creating a separate record.

![alt text](/app/assets/images/image1.JPG "Non-nested Routes")

2. Users are not able to create, edit, or destroy Artists, Albums, or Songs directly from the database.  This scenario would be closer to spotify: the users are only able to browse and favorite music that's managed by moderators.  This would save a ton of room in the database - there would only be one instance of an artist/album/song that's shared by every user.  This would mean no manual input by the user, which I would personally consider a benefit (no misspellings, saved time, DB consistency, etc).  In this case the routes would not be nested and users would only be able to "add" and "delete" Artists/Albums/Songs from their collection (which would also possibly need UserArtists, UserAlbums, and UserSongs models and associations (each of which could use the polymorphic Favoriteable nicely)).

Favorites is also a concept I've been debating.  In my app Endorsesaurus I found myself in a similar debacle but I used what I call "cascading likes" which works but is a bit of a pain in the ass.  For instance, if I was to use cascading likes I would use a boolean field called "favorite" on the song migration.  If a user liked an album, it would find all of the songs associated with that album and "like" them.  If a user liked an artist, it would find every album, which would find every song etc.  It's a useful system because it cuts down on confusion in a database (for instance having a "like" for an artist, an album, and a song).  Now that I'm thinking about it though, I'm considering using a polymorphic to replace cascading likes.  It warrants more thought.

Future additions would be:
- Testing to ensure the favoriting process is working properly
- I've been spending a lot of time learning React lately and this would work well with shared states and such.
- Adding authentication for devise
- 