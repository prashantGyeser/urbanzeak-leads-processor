require 'sidekiq/web'

Rails.application.routes.draw do
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
  get 'import_training_data/import_leads'
  end

  namespace :dashboard do
  get 'import_training_data/import_non_leads'
  end

  namespace :dashboard do
  get 'import_unprocessed_leads/s3_import'
  end

  #get 'import_unprocessed_leads/s3_import'

  namespace :dashboard do
    root 'leads#index'
    get 'leads/index'
    post 'leads/move_tweet_to_nonleads'
  end

  mount Sidekiq::Web => '/sidekiq'

  post 'users' => 'users#create'


end
