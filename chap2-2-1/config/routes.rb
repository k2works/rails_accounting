Chap221::Application.routes.draw do
  resources :accounts do
    collection { post :import }    
  end
  root :to => 'accounts#index'
end
