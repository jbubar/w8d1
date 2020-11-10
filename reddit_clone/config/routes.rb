Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  get 'posts/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :destroy]
end
