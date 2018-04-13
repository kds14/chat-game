Rails.application.routes.draw do

  get 'game/index'
  get 'game/create' => 'game#create'
  get 'game/rooms' => 'game#get_rooms'
  post 'game/join' => 'game#join'
  root 'game#index'
end
