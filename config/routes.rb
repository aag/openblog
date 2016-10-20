Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :posts, only: [:show, :new, :create]

  get 'feed/posts', to: 'feed#posts'

  get 'admin', to: 'admin#index'
  post 'admin/post/:id/publish', to: 'admin#publish_post', as: 'publish_post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
