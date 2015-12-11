Rails.application.routes.draw do
  root 'pages#welcome'

  get 'pages/analytics' => 'pages#analytics'

  resources :charges



  get 'search/listings' => 'searches#listings'
  post 'listings/:listing_id/charge' => 'reservations#charge', as: 'reservation_charge'

  resources :users do
    # get 'users/:user_id/clubs/new' => 'users#clubs', as: 'clubs'
    # resources :listings, except: [:index]
    # resources :reservations
    resources :reviews
  end

  resources :renters do
    resources :reservations
  end

  resources :suppliers do
    get 'listings' => 'listings#supplier_listings'
    resources :clubs do
      resources :listings, except: [:index]
    end
    resources :club_sets do
      resources :listings, except: [:index]
    end
  end

  get 'listings/four_listings/:start_row' => 'listings#four_listings', as: 'four_listings'

  resources :listings do
    resources :reservations
    resources :reviews
  end



  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

###### API V1 ################

  namespace :api do
   namespace :v1 do

     resources :users

     resources :suppliers

   end
 end

end
