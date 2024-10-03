Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :apartments, only: [:index, :create, :show, :update, :destroy]
  resources :residents, only: [:index, :create, :show, :update, :destroy]
  resources :vehicles, only: [:index, :create, :show, :update, :destroy]
  resources :deliveries, only: [:index, :create, :show, :update, :destroy]

  resources :deliveries do
    collection do
      post 'find_by_reader_code', to: 'deliveries#find_by_reader_code'
    end
  end

  resources :residents do
    member do
      get 'details'
    end
  end

  resources :apartments do
    member do
      get 'details'
    end
  end

  resources :apartment_residents, only: [:index, :create, :show, :update, :destroy]

  resources :residents do
    # Nested route to get apartment_residents for a resident
    get 'apartment_residents', to: 'apartment_residents#by_resident'
    # post 'apartment_residents', to: 'apartment_residents#create'
  end

  resources :apartments do
    # Nested route to get apartment_residents for an apartment
    get 'apartment_residents', to: 'apartment_residents#by_apartment'
    # post 'apartment_residents', to: 'apartment_residents#create'
  end
end
