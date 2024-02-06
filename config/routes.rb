Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  post("/add_user", { :controller => "users", :action => "create"})
  get("/users/:path_id", { :controller => "users", :action => "show" })
  post("/update_user/:path_id", { :controller => "users", :action => "update" })
  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  post("/insert_photo_record", { :controller => "photos", :action => "create"})
  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })
  post("/add_comment", { :controller => "photos", :action => "create_comment"})
end
