TedxIteratie3::Application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users, :only => [:show] do
    member { get :follow}
    member { get :unfollow}
  end
  resources :blogposts, :only => [:index] do 
    match "comment", :to => "blogposts#comment", :as => "comment", :via => :post
    match "tag_list", :to => "blogposts#tag_list", :as => "tag_list", :via => :post
    member { post :rate }
  end
end
