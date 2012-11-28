Pelicans2k::Application.routes.draw do
  get "ajax/get_cal_for_team"

  devise_for :users
  
  root :to => "public_pages#index"
  
  #Routing for the public pages
  match "/joukkueet" => "public_pages#teams"
  match "/linkkeja" => "public_pages#links"
  match "/seura" => "public_pages#club"
  match "/saannot" => "public_pages#rules"
  match "/kamaporssi" => "public_pages#equipment_market"
  
  #Routing for the private pages
  match "/kirjaudu_sisaan" => "private_pages#login"
  match "/landing" => "private_pages#landing"
  match "/uutisten_hallinta" => "private_pages#manage_news"
  match "/paakalenterin_hallinta" => "private_pages#manage_main_calendar"
  match "/edit_news" => "private_pages#edit_news"
    
  #Ajax calls routing
  match "/get_cal_for_team" => "ajax#get_cal_for_team"
  match "/get_cal_for_all" => "ajax#get_cal_for_all"
end
