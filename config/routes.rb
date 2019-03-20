Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  get 'articles' => 'articles#index'
  get 'articles/new' => 'artilcles#new'
end
