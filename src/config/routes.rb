Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'

  # 投稿機能
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
  end
end
