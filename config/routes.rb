Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :hazards
      get '/walkscore', to: 'score#index'
      resources :votes, only: :update
      post 'users', to: 'users#create'
    end
  end
end
