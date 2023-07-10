Rails.application.routes.draw do
  get '/' => 'homes#top', as: 'root'
  get 'home/about' => 'homes#about' , as: 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:[:index,:show,:edit,:update]
  resources :books, only:[:create,:index,:show,:edit,:update,:destroy]
end
