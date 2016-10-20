Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'

  resources :posts, only: [:show, :new, :create]
  post '/posts/:id/comments', to: 'posts#create_comment', as: 'comments'

  get 'feed/posts', to: 'feed#posts'

  get 'admin', to: 'admin#index'
  post 'admin/post/:id/publish', to: 'admin#publish_post', as: 'publish_post'
  post 'admin/comment/:id/spam', to: 'admin#mark_spam', as: 'spam_comment'
  post 'admin/comment/:id/ham', to: 'admin#mark_ham', as: 'ham_comment'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
