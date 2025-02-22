Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  post("/directors/create", { :controller => "directors", :action => "create" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors/update/:path_id", { :controller => "directors", :action => "update" })
  get("/directors/delete/:path_id", { :controller => "directors", :action => "delete" })

  get("/movies", { :controller => "movies", :action => "index" })
  post("/movies/create", { :controller => "movies", :action => "create" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies/update/:path_id", { :controller => "movies", :action => "update" })
  get("/movies/delete/:path_id", { :controller => "movies", :action => "delete" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  post("/actors/create", { :controller => "actors", :action => "create" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/actors/update/:path_id", { :controller => "actors", :action => "update" })
  get("/actors/delete/:path_id", { :controller => "actors", :action => "delete" })
end
