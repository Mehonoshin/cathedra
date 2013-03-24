Cathedra::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users

  resources :articles, except: [:index]
  resources :pages
  resources :materials
  resources :users do
    member do
      put :make_admin
      put :make_user
      put :make_tutor
    end
  end
  get "/news" => "articles#index", as: :news
  get "/history" => "pages#history", as: :history
  get "/staff" => "pages#staff", as: :staff
  get "/bases" => "pages#bases", as: :bases
  root :to => 'main#index'
end
