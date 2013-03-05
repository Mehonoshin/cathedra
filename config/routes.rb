Cathedra::Application.routes.draw do
  devise_for :users

  resources :articles
  get "/news" => "articles#index", as: :news
  root :to => 'main#index'
end
