# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#insert studio data
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save 

#save studio to variable
wb = Studio.find_by({"name"=>"Warner Bros."})

# #insert movies 
movie = Movie.new 
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["studio_id"]= wb["id"]
movie["rated"] = "PG-13"
movie.save 

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["studio_id"] = wb["id"]
movie["rated"] = "PG-13"
movie.save

movie = Movie.new 
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["studio_id"] = wb["id"]
movie["rated"] = "PG-13"
movie.save 

# #Insert actors into actor table
actor = Actor.new
actor["name"] = "Christian Bale"
actor.save 

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save 

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save 

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save 

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save 

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save 

actor = Actor.new
actor["name"] = "Aaron Ekhart"
actor.save 

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save 

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save 

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save 

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save 

# # save actors into variables
joseph = Actor.find_by({"name"=>"Joseph Gordon-Levitt"})
maggie =  Actor.find_by({"name" => "Maggie Gyllenhaal"})
anne = Actor.find_by({"name"=> "Anne Hathaway"})
tom = Actor.find_by({"name"=>"Tom Hardy"})
aaron = Actor.find_by({"name" => "Aaron Ekhart"})
heath = Actor.find_by({"name" => "Heath Ledger"})
gary = Actor.find_by({"name"=>"Gary Oldman"})
liam =  Actor.find_by({"name"=>"Liam Neeson"})
katie = Actor.find_by({"name" => "Katie Holmes"})
michael = Actor.find_by({"name"=>"Michael Caine"})
christian = Actor.find_by({"name" => "Christian Bale"})

# save movies into variables

movie1 = Movie.find_by({"title"=>"Batman Begins"})

movie2 = Movie.find_by({"title"=>"The Dark Knight"})
movie3 = Movie.find_by({"title"=>"The Dark Knight Rises"})

# #insert data into the roles table 
role = Role.new 
role["character_name"] = "Bruce Wayne"
role["movie_id"]=movie1["id"]
role["actor_id"]=christian["id"]
role.save

role=Role.new
role["character_name"] = "Alfred"
role["movie_id"] = movie1["id"]
role["actor_id"] = michael["id"]
role.save 

role=Role.new
role["character_name"] = "Ra's Al Ghul"
role["movie_id"] = movie1["id"]
role["actor_id"] = liam["id"]
role.save 

role=Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = movie1["id"]
role["actor_id"] = katie["id"]
role.save 

role=Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = movie1["id"]
role["actor_id"] = gary["id"]
role.save 

role=Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = movie2["id"]
role["actor_id"] = christian["id"]
role.save 

role=Role.new
role["character_name"] = "Joker"
role["movie_id"] = movie2["id"]
role["actor_id"] = heath["id"]
role.save 

role=Role.new
role["character_name"] = "Harvey Dent"
role["movie_id"] = movie2["id"]
role["actor_id"] = aaron["id"]
role.save 

role=Role.new
role["character_name"] = "Alfred"
role["movie_id"] = movie2["id"]
role["actor_id"] = michael["id"]
role.save 

role=Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = movie2["id"]
role["actor_id"] = maggie["id"]
role.save 

role=Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = movie3["id"]
role["actor_id"] = christian["id"]
role.save 

role=Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = movie3["id"]
role["actor_id"] = gary["id"]
role.save 

role=Role.new
role["character_name"] = "Bane"
role["movie_id"] = movie3["id"]
role["actor_id"] = tom["id"]
role.save 

role=Role.new
role["character_name"] = "John Blake"
role["movie_id"] = movie3["id"]
role["actor_id"] = joseph["id"]
role.save 

role=Role.new
role["character_name"] = "Selina Kyle"
role["movie_id"] = movie3["id"]
role["actor_id"] = anne["id"]
role.save 

# database = Role.joins(:actor, :movie)

# p database
# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
movies_db = Movie.all
movies = []
for movie in movies_db
    title = movie["title"]
    year = movie["year_released"]
    # year = year.to_s
    rating = movie["rated"]

    studio = Studio.find_by("id"=>movie["studio_id"])
    studio_name = studio["name"]

    film = {:name => "#{title}",  :rated => "#{rating}", :studio => "#{studio_name}"}
    movies.push(film)
   
end 



# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# loop through movies
for movie in movies_db
    # find all roles for the each movie movie 

end



# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
