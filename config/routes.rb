Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see http://guides.rubyonrails.org/routing.html
  root 'albums#home'
  post '/albums/upload' => 'albums#upload'
  resources :albums, only: [:index, :new, :create, :edit, :update, :show, :destroy]
end
