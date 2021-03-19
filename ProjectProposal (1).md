# Project Proposal
## Who’s on your team?
Our team members are Anne Lee and Laura Nguyen.

## What’s your project idea?
For our project, we are doing an app called “Bobagram”. This app
allows users to review boba places near them and upload pictures of
what they drink. Google maps already established the boba places in
Boston, but there’s no consistency and specificity in the reviews. In
other words, we want to create a space for shared boba lovers. The app
will allow users the chance to offer recommendations of places and
drinks to other users, compiling reviews into one place and creating a
sense of community. Each user will have their own photo blog of their
uploaded reviews and pictures, and each upload will have space for
others to like and comment. Boba places on the app will come with a
description of their specialty, wifi availability, affordability,
closeness, photos of their surroundings, opening hours, and contact
information. There will also be a section containing reviews made by
users on the app, as well as keeping track of how many users “like”
the place. 

## What API do you plan to use?
We are planning to use the Google Places API. This API already has
functions that return a list of places based on a user’s locations.
This will allow us to find nearby Boba Tea shops close to the user. In
order to determine closeness, we will also use a Geolocation API to
track where the user is. Another aspect of the Places API is that it
returns detailed information about a specific place, which is where
we’ll get all the information about the Boba place mentioned above.
Lastly, we’ll also be using the photos feature from the Place API
where it provides millions of place-related photos stored in the
Google’s Places API Database. 

## What real-time behavior are you planning?
We will incorporate real-time behavior by updating a User’s photoblog
immediately when they upload a picture and when another user likes and
comments. As soon as a user posts a picture, it will be available for
all other users to see. As soon as a user comments and likes, other
users, including the original poster, will be able to see it. These
actions are instantaneous and available to all users on the app. When
a user posts a review, the corresponding place the review is for will
also show up for the boba place’s review field. The same logic applies
to when a user “likes” a place.  Another course of real-time behavior
is utilizing the Geolocation to keep track of what Boba place a user
is currently at. As long as a user accepts permission to use their
current location, the app will calculate the proximity of boba places
in their area, and return a list of places nearby. Whenever the user
opens the app, their location will update, and the list of recommended
places will update as well.

## What persistent state other than users will you be storing in a Postgres DB?
One table inside the Postgres DB is for the available Boba places in
the area. Each Boba place will have its name (string), specialty
(string), wifi availability (boolean), affordability (integer,
converted to $s later), proximity (float of miles away), photos of
surroundings (photo hash), hours open (time frame), and contact
information (string). There will also be a section of reviews/posts
made by users of the app, and a tracking system of how many “likes” a
place gets. We will use the Google Places API to retrieve the
information. Another table is for each user’s photoblog. A post in a
Photoblog has a userid (integer), the date posted (date timeframe),
name of the boba place (string), name of the drink bought (optional;
string), description (review of the place/drink; string), as well as a
photo of what they’re reviewing (photo hash).   For each user, we are
also adding profile pictures (photo hash), their current location
(from geolocation API), a bio section (optional; string), an area
listing their favorite drinks and places (string), as well as their
name and email (string). Each user also has their own photoblog, which
has a bunch of posts/reviews.

## What “something neat” thing are you going to do?
One of our “something neat”s is a novel browser feature, which is the
geolocation API. This is to keep track of a user’s location near a
boba shop and to calculate the proximity of boba places in their area.
Like other apps, this will require a user’s approval due to privacy
concerns. Based on the proximity distances, the places will be ranked
in the recommendations section of boba places for the user to refer
to. Depending on the user’s locations, the boba places will be
different, so that users in different areas will have a list of places
specifically catered to them. We will most likely make the user’s
location anonymous to other users unless they give permission to
share. Users can find other users on the app in their area, building a
sense of community and taking into account which places are popular
and better reviewed.  Once a user moves to a different location, the
list of boba places will be updated as long as the app tracks their
current location. 

## Experiment 1: Populating the Database
This experiment was to set up the initial Postgres DB, as there are a
lot of states and fields stored (listed above). We needed to create a
table for a boba place, the users, and each user’s photos in a
photoblog. This step was more to figure out the complexity rather than
difficulty, as we have more fields and states to keep track of
throughout the App’s production. It took some effort to get working,
as we were always adding in more fields and migrating accordingly. 
For “user”s, we gave the fields: name, email, bio, location,
favorites, and photos. We tested to see if all aspects of the fields
showed up on the site correctly, and tested to see what the return
type of the geolocation API would be. The database for a user was able
to be created, so that was a success.
The next state we needed to create inside the database was the boba
places themselves, which we called “posts”. We gave the fields: name,
specialty, wifi_availability, affordability, proximity, photos of
surroundings, hours open, and reviews made by other users. These
fields would be filled by the Google Places API. Creating the database
was a success, and we were able to keep track of all the fields we
added and migrated. 
Finally, the last state we created was the reviews and photos uploaded
by the user, which we called “photo”s. A photo entailed: the userid
connecting it to a user, the date posted, name of the boba place, name
of the drink bought (optional, the user might not have bought a drink
and does not need to fill in the field if not needed), a
description/review section, and the photo they are uploading. This
database creation was a success. 
In conclusion, we were able to demonstrate that the complex database
could be done, and we can now focus on connecting some fields to the
APIs that help to generate them. Our team learned about how the
“has_many” and “belongs_to” functions work, as well as what components
the Google Places API leaves readily available for us to use for
describing the Boba “posts” fields. 

## Experiment 2: Testing out the liking feature for posts
Because this app is important for connecting users with other users,
we wanted to ensure that the commenting and liking features worked. We
tested out a post on a webpage and opened another webpage acting as a
separate user and tested to see if this second user was allowed to
like and comment and after submitting a comment, it would take them
back to a confirmation page with the list of comments on the post. We
also refreshed the page and closed out the page and returned to see if
the data had been saved, in which it has. The page did not throw any
errors and was therefore successful. 
We learned more about user experience and user interaction. We
realized how we want to structure the likes with respect to comments
and in respect to the post itself and how they are all scaled and
positioned on the page. We learned that even if the user logs out or
the page is refreshed, the data remains because it is connected to the
Postgres database. We also learned that likes can have the type
boolean because the post will either be liked or not liked, one or the
other.

## What kinds of users do you expect to have use your app?
This app will not be restricted to anyone, but it will have a target
group of young adults and teens who frequently drink boba. This will
most likely include college students and high school students. Since
Northeastern is located in Boston, we are familiar with the boba
places in Boston and Cambridge area. There are especially a lot of
places in Chinatown, Allston, and Back Bay that we can capture.
Therefore, at first, the app will draw in mainly students from
Northeastern, Boston University, Boston College, Harvard, MIT, and
other local colleges in the greater Boston area.  Those who are new to
boba are also likely to try out our application to gain a better
understanding of boba places. Other users will include those who
simply enjoy the taste of fruit and milk teas and boba pearls, those
who want to find a boba place to socialize with others, those who are
looking for places to study, and those who are looking for a dessert
place after lunch or dinner.
Because the app is user-driven, we expect to build a community of boba
lovers in Boston and give a better understanding of what places users
frequently go to and recommend so that travelers into Boston will
already have a list of recommendations. 

## For each kind of users, what is their most common workflow / user story?
A college student who is new to boba and wants to try it out will
first search up what boba is and ask around to know how others feel
about it. They will most likely try out multiple spots before making a
final decision about whether they will continue to drink boba and
whether they found their favorite spot or not within the next couple
of weeks. If they enjoy boba drinking, then they can become a regular
user of the app.
A college student who simply loves the taste of teas and boba pearls
will read through all the reviews of each boba place on the app. They
will also pay particular attention to each boba places’ specialty.
After they find a spot they would like to try, they physically go
there and try it out. Depending on whether they liked it or not, they
themselves will upload photos and write reviews and take note of which
drinks they enjoyed and which ones they didn’t.
A college student who is looking for a boba place to socialize will
look through the boba places on the app and through their photos in
particular, rather than the quality of the boba. If the space looks
spacious and empty and fairly quiet and if the boba place is open for
indoor dining during COVID times, then that is a potential spot that
this user will go to. Also, the closeness in miles will be important
here too.
A college student looking for a dessert place after a meal will look
through the boba places on the app to see both quality of boba and the
openness of space in case they would like to chill there with their
friends after a meal. A college student who is looking for fellow
friends and boba lovers, and is looking for a place to meet other
enthusiasts. The geolocation API will allow them to see how many
people are concentrated in an area, and what is popular for the day.
