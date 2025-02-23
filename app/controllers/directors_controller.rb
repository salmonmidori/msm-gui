class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
    new_director = Director.new
    new_director.name = params.fetch("director_name")
    new_director.dob = params.fetch("director_dob")
    new_director.bio = params.fetch("director_bio")
    new_director.image = params.fetch("director_img")
    new_director.save
    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("path_id")
    existing_director = Director.where({ :id => the_id})[0]
    existing_director.name = params.fetch("director_name")
    existing_director.dob = params.fetch("director_dob")
    existing_director.bio = params.fetch("director_bio")
    existing_director.image = params.fetch("director_img")
    existing_director.save
    redirect_to("/directors/#{the_id}")
  end

  def delete
    the_id = params.fetch("path_id")
    existing_director = Director.where({ :id => the_id})[0]
    existing_director.destroy
    redirect_to("/directors")
  end
end
