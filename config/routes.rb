PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]#, :show]
  end

  resources :categories

  resources :users, only: [:create]

  get '/register', to: 'users#new'

  post '/login', to: 'sessions#create'

  get '/login', to: 'sessions#new'

  get '/logout', to: 'sessions#destroy'
end

