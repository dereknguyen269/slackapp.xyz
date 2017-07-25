Rails.application.routes.draw do
  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'home#index'
  post 'contact', to: 'home#contact'
  get 'status', to: 'health#index'

  namespace :admin, path: 'admin' do
    root 'dashboard#index'
    resources :dashboard, only: [:index, :create]
    resources :photo_attrs
    resources :workers, only: :index
  end
end

Rails.application.routes.named_routes.tap do |routes|
  routes.add(:admin_root, routes.get(:admin_dashboard_index))
end
