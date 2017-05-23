Rails.application.routes.draw do
get "/" => "products#index"
get "/products" => "products#index"
get "products/new" => "products#new"
get "/products/:id" => "products#show"  
post "/products" => "products#create"
get "/products/:id/edit" => "products#edit"
patch "/products/:id" => "products#update"
delete "/products/:id" => "products#destroy"

get "/products/:id/images/new" => "images#new"
post "/products/:id/images" => "images#create"

get "/signup" => "users#new"
post "/users" => "users#create"

get "/login" => "sessions#new"
post "/login" => "sessions#create"
get "/logout" => "sessions#destroy"

post "/orders" => "orders#create"
get "/orders/:id" => "orders#show"

post "/cart" => "carted_products#create"
get "/checkout" => "carted_products#index"
patch "/complete" => "carted_products#update"
end
