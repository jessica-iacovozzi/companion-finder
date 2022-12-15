Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: %i[show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :dogs, only: %i[index]
      resources :organizations, only: [:index]
    end
  end
end
