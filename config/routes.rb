Rails.application.routes.draw do
  resources :links, only: [:index, :new, :create, :edit, :update]

  root to: redirect('links')
end
