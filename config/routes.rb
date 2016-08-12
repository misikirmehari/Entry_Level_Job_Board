Rails.application.routes.draw do


  root 'static_pages#index'

  resources :users,
    only: [:new, :create],
    path_names: {new: 'signup'}

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

end
