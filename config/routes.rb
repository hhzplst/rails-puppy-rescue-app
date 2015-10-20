Rails.application.routes.draw do
  root "puppies#index"  
  resources :puppies
end
