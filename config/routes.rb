Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :users do
    resources :comments, module: :users
  end
  resources :articles do
    member do
      put :published
      put :not_published
    end
  end
  get '/search' => 'artices#search', :as => 'search_page'

  resources :categories, except: [:destroy]
end
