Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  # Nest comments under posts. The only: [] prevents us from creating any
  # additional post routes, as we've nested those under topics.
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
