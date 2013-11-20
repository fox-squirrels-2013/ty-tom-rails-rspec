DbcRspecRails::Application.routes.draw do
  namespace :admin do
    resources :posts
  end

  resources :posts
  # delete '/admin/posts/:destroy' => 'admin/posts#destroy'
  root :to => "home#index"
end
