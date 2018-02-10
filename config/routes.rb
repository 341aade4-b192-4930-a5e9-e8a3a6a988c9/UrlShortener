Rails.application.routes.draw do
  resources :links, only: [:index, :new, :create, :edit, :update]

  get 'go/:short_url', to: 'links#go', as: :go

  root to: redirect('links')
end
