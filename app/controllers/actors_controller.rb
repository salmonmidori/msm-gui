class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    new_actor = Actor.new
    new_actor.name = params.fetch("actor_name")
    new_actor.dob = params.fetch("actor_dob")
    new_actor.bio = params.fetch("actor_bio")
    new_actor.image = params.fetch("actor_img")
    new_actor.save
    redirect_to("/actors")
  end

  
  def update
    the_id = params.fetch("path_id")
    existing_actor = Actor.where({ :id => the_id})[0]
    existing_actor.name = params.fetch("actor_name")
    existing_actor.dob = params.fetch("actor_dob")
    existing_actor.bio = params.fetch("actor_bio")
    existing_actor.image = params.fetch("actor_img")
    existing_actor.save
    redirect_to("/actors/#{the_id}")
  end

  def delete
    the_id = params.fetch("path_id")
    existing_actor = Actor.where({ :id => the_id})[0]
    existing_actor.destroy
    redirect_to("/actors")
  end
end
