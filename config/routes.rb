Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/characters" => "characters#index"
    get "/characters/:id" => "characters#show"
    post "/characters" => "characters#create"
    patch "/characters/:id" => "characters#update"

    delete "/characters/:id" => "characters#destroy"

    get "/spells" => "spells#index"

    patch "/characters/:id/:spell_id" => "characters#add_spell"
    delete "/characters/:id/:spell_id" => "characters#destroy_spell"
  end
end
