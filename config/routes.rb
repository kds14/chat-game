Rails.application.routes.draw do

  get 'game/index'
  get 'game/create' => 'game#create'
  root 'game#index'
end
