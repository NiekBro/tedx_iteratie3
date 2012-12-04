TedxIteratie3::Application.routes.draw do

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
