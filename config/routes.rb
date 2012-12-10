Pelicans2k::Application.routes.draw do
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
  match "/tiimikalenterin_hallinta" => "private_pages#manage_team_calendar"
  match "/muokkaa_uutista/:id" => "private_pages#update_news"
  match "/muokkaa_pelajaat/:id" => "private_pages#edit_players" 
  match "/pelaajien_hallinta" => "private_pages#manage_players"
  match "/toimihenkiloiden_hallinta" => "private_pages#manage_staff"
  match "/muokkaa_toimihenkiloa" => "private_pages#edit_staff"
  
  
  #Ajax calls routing
  match "/get_cal_for_team" => "ajax#get_cal_for_team"
  match "/get_cal_for_all" => "ajax#get_cal_for_all"
  match "/save_ice_time" => "ajax#save_ice_time"
  
  match "/create_news" => "ajax#create_news"
  match "/update_news" => "ajax#update_news"
  match "/delete_news/:id" => "ajax#delete_news"
  
  match "/get_staff_members/:id" => "ajax#get_staff_members"
  match "/get_players/:id" => "ajax#get_players"
  
end
