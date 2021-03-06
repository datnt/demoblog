Blog::Application.routes.draw do
  mount Doorkeeper::Engine => '/oauth'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :articles do
        collection do
          get :comments, :categories
          post :comment
        end
      end
      match 'user', to: 'users#show'
    end
  end


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  root to: 'articles#index'
  resources :articles  do
    collection do
      post :comment
      get :publish
    end
  end
  resources :categories  do
    collection do
    end
  end
end
