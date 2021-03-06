Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  # Nest comments under posts. The only: [] prevents us from creating any
  # additional post routes, as we've nested those under topics.
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vite' => 'votes#down_vote', as: :down_vote
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
