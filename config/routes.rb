Cathedra::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :articles, except: [:index]
  resources :pages
  get "/news" => "articles#index", as: :news
  get "/history" => "pages#history", as: :history
  get "/staff" => "pages#staff", as: :staff
  root :to => 'main#index'
end
