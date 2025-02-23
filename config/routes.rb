Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/directors/create", { :controller => "directors", :action => "create" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/update_director/:path_id", { :controller => "directors", :action => "update" })
  get("/delete_director/:path_id", { :controller => "directors", :action => "delete" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/movies/create", { :controller => "movies", :action => "create" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/update_movie/:path_id", { :controller => "movies", :action => "update" })
  get("/delete_movie/:path_id", { :controller => "movies", :action => "delete" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/actors/create", { :controller => "actors", :action => "create" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/update_actor/:path_id", { :controller => "actors", :action => "update" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "delete" })
end
