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
    resources :api_services
  end

  resources :instagram, only: [:index, :create] do
    collection do
      get :callback
    end
  end

 # mount ActionCable.server => '/cable'
end

Rails.application.routes.named_routes.tap do |routes|
  routes.add(:admin_root_path, routes.get(:admin_dashboard_index))
end
