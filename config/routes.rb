Rails.application.routes.draw do
  default_url_options host: 'localhost', port: 3000

  get 'verification/:token', to:'users#verify', as:'verify_email'

  get 'auth/:provider/callback', to:'sessions#oauth'

  root 'static_pages#index'

  resources :users,
    only: [:new, :create],
    path_names: {new: 'signup'}

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'jobs' => 'jobs#index'

  get 'about' => 'static_pages#about'

  get 'contact' => 'static_pages#contact'

end
