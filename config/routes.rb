Pelicans2k::Application.routes.draw do
  #Routing for the public pages
  match "/joukkueet" => "page#teams"
  match "/linkkeja" => "page#links"
  match "/seura" => "page#club"
  match "/saannot" => "page#rules"
  match "/kamaporssi" => "page#equipment_market"
  
  
  
  root :to => "page#index"
end
