Rails.application.routes.draw do
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  get 'about', to: 'pages#about'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to: 'messages#create'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  mount ActionCable.server, at: '/cable'
end
