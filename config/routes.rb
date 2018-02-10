Rails.application.routes.draw do
  resources :links, only: [:index, :new, :create]

  root to: redirect('links')
end
