require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :dashboard do
  get 'generate_query/datasift'
  end

  namespace :dashboard do
  get 'reports/index'
  end

  resources :datasift_subscriptions

  namespace :dashboard do
  get 'datsift/subscriptions'
  end

  namespace :dashboard do
  get 'datsift/billing'
  end

  namespace :dashboard do
  get 'datsift/logs'
  end

  namespace :api , :defaults => {:format => :json} do
    namespace :v1 do
      get "leads/index"
      get 'reports/all'
    end
  end

  namespace :dashboard do
  get 'home/index'
  end

  namespace :dashboard do
  get 'import_manually_checked_leads/import'
  end

  namespace :dashboard do
  get 'classifications/bayesian_processor'
  end

  namespace :dashboard do
  get 'import_training_data/import_data'
  end

  namespace :dashboard do
    root 'leads#index'
    get 'leads/index'
    post 'leads/move_tweet_to_nonleads'
    get 'unchecked_leads/export_as_csv'
  end

  mount Sidekiq::Web => '/sidekiq'

  post 'users' => 'users#create'


end
