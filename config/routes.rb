Rails.application.routes.draw do
  devise_for :accounts
  get "u/:username" => "home#profile", as: :profile

  resources :publications do
    resources :posts
  end

  resources :subscriptions
  resources :comments, only: [:create], defaults: { format: 'js' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
