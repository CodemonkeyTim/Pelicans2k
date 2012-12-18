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

  match "/paakalenterin_hallinta" => "private_pages#manage_main_calendar"
  match "/tiimikalenterin_hallinta" => "private_pages#manage_team_calendar"
  
  match "/uutisten_hallinta" => "private_pages#manage_news"
  match "/muokkaa_uutista/:id" => "private_pages#update_news"
   
  match "/pelaajien_hallinta" => "private_pages#manage_players"
  match "/muokkaa_pelaajaa/:id" => "private_pages#edit_players"
  
  match "/toimihenkiloiden_hallinta" => "private_pages#manage_staff"
  match "/muokkaa_toimihenkiloa/:id" => "private_pages#edit_staff"
  
  match "/joukkueiden_hallinta" => "private_pages#manage_teams"
  match "/muokkaa_joukkuetta/:id" => "private_pages#edit_team"
  
  match "/kayttajien_hallinta" => "private_pages#manage_users"
  match "/muokkaa_kayttajaa/:id" => "private_pages#edit_user"
  match "/uusi_salasana/:id" => "private_pages#new_user_password"
  
  #Ajax calls routing
  match "/get_cal_for_team" => "ajax#get_cal_for_team"
  match "/get_cal_for_all" => "ajax#get_cal_for_all"
  match "/save_ice_time" => "ajax#save_ice_time"
  
  match "/create_news" => "ajax#create_news"
  match "/update_news" => "ajax#update_news"
  match "/delete_news/:id" => "ajax#delete_news"

  match "/get_staff_members/:id" => "ajax#get_staff_members"
  match "/update_staff_member" => "ajax#update_staff_member"
  match "/create_staff_member" => "ajax#create_staff_member"
  match "/delete_staff_member/:id" => "ajax#delete_staff_member"
  
  match "/get_players/:id" => "ajax#get_players"
  match "/update_player" => "ajax#update_player"
  match "/create_player" => "ajax#create_player"
  match "/delete_player/:id" => "ajax#delete_player"

  match "/update_team" => "ajax#update_team"
  match "/create_team" => "ajax#create_team"
  match "/delete_team/:id" => "ajax#delete_team"

  match "/update_user" => "ajax#update_user"
  match "/save_new_password" => "ajax#save_new_password"
  
end
