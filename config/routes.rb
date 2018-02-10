Rails.application.routes.draw do
  resources :links, only: [:index]

  root to: redirect('links')
end
