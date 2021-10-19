Rails.application.routes.draw do
  resources :people do
    resource :address
    collection { post :import }
  end
  get "secret", to: "people#secret"
  get 'cep', to: "cep#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
