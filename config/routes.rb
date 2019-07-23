Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  post 'posts/comment_create/:post_id' => 'posts#comment_create'
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
