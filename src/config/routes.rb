Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # リスト5.33:ユーザー登録ページのルート(https://railstutorial.jp/chapters/modeling_users?version=4.2#cha-modeling_users)
  get 'signup'  => 'users#new'
  resources :users
end
