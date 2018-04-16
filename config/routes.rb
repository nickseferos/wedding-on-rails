Rails.application.routes.draw do

  devise_for :admins
  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  resources :events, except: [:index] do

    resources :groups do
      resources :guests
    end

    resources :photos
    resources :venue_photos

    resources :task_lists do
      resources :tasks
    end

    resources :guests
    resources :groups do
      put 'rsvp', on: :collection
      resources :guests
    end
  end

  namespace :admin do
    resources :events, except: [:index] do
      resources :sections
      resources :guests, except: [:show]
      resources :groups
      resources :parties
      resources :registries
    end
    root "admin#dashboard"
  end

  resources :photos, :only => [:index, :create, :destroy]

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  root "events#show"

end
