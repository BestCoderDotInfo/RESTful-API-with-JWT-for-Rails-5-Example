Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'home#index'
  resources :home, only: :index
  scope module: 'api/v1', constraints: ApiVersion.new('v1', true) do
    post 'login' => 'authentication#authenticate'
    resources :users, only: :index
    resources :posts
    resources :comments, only: :create
  end
end
