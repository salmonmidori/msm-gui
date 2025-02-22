class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("movie_title")
    new_movie.year = params.fetch("movie_year")
    new_movie.duration = params.fetch("movie_duration")
    new_movie.description = params.fetch("movie_description")
    new_movie.image = params.fetch("movie_img")
    new_movie.director_id = params.fetch("movie_director_id")
    new_movie.save
    redirect_to("/movies")
  end
  def update
    the_id = params.fetch("path_id")
    existing_movie = Movie.where({ :id => the_id})
    existing_movie.title = params.fetch("movie_title")
    existing_movie.year = params.fetch("movie_year")
    existing_movie.duration = params.fetch("movie_duration")
    existing_movie.description = params.fetch("movie_description")
    existing_movie.image = params.fetch("movie_img")
    existing_movie.director_id = params.fetch("movie_director_id")
    existing_movie.save
    redirect_to("/movies/#{path_id}")
  end
  def delete
    the_id = params.fetch("path_id")
    existing_movie = Movie.where({ :id => the_id})[0]
    existing_movie.destroy
    redirect_to("/movies")
  end
end
