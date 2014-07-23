PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
    member do
      post '/vote', to: 'votes#create'
    end

    resources :comments, only: [:create] do
      member do
        post '/vote', to: 'votes#create'
      end
    end


  end

  resources :categories

  resources :users, only: [:create, :show, :edit, :update]
  get '/register', to: 'users#new'

  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

end

