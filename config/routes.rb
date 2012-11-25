Pelicans2k::Application.routes.draw do
  devise_for :users

  #Routing for the public pages
  match "/joukkueet" => "public_pages#teams"
  match "/linkkeja" => "public_pages#links"
  match "/seura" => "public_pages#club"
  match "/saannot" => "public_pages#rules"
  match "/kamaporssi" => "public_pages#equipment_market"
  
  
  
  root :to => "public_pages#index"
end
