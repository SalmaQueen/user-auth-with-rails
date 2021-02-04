Rails.application.routes.draw do
  # post 'user_token' => 'user_token#create'
  resources :users,defaults: { format: :json }
  scope '/auth',defaults: { format: :json } do
    post '/signin', to: 'user_token#login'
    post '/signup', to: 'users#create'
    post '/signout', to: 'users#destroy'
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
