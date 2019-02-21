Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routing Users
  resources :cocktails, except: [:destroy, :edit, :update]

  # Root page set
  root to: 'cocktails#index'
end
