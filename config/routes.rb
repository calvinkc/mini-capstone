Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get "/shopping" => "products#shopping_method"

get "/all" => "products#shopping_all"
end
