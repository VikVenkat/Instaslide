Instaslide::Application.routes.draw do
  devise_for :users

  get "home/index"

  resources :slides

  resources :whiteboards

  root :to => "home#index"
  
  get "whiteboards/convert_image_task" 

  # See how all your routes lay out with "rake routes"

end
