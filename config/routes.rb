Rails.application.routes.draw do
  root 'home#index'
  resources :messages, only: :index
  namespace :admin, path: 'admin' do
    root 'dashboard#index'
    get '/', to: redirect('/dashboard')
    resources :dashboard, only: [:index]
    resources :messages
    post '/', to: 'dashboard#create'
    get '/auto', to: 'dashboard#auto'
  end
end

Rails.application.routes.named_routes.tap do |routes|
  routes.add(:admin_root, routes.get(:admin_dashboard_index))
end
