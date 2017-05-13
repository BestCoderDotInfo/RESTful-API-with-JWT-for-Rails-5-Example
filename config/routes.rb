Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # namespace :api do
  #   namespace :v1 do
  #     post 'login' => 'authentication#authenticate'
  #     resources :users, only: :index
  #     resources :posts
  #   end
  # end
  scope module: 'api/v1', constraints: ApiVersion.new('v1', true) do
    post 'login' => 'authentication#authenticate'
    resources :users, only: :index
    resources :posts
  end
end
