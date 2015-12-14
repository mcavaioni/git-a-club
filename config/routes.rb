Rails.application.routes.draw do
  root 'pages#welcome'

  get 'pages/analytics' => 'pages#analytics'

  resources :charges

  get 'search/listings' => 'searches#listings'
  post 'listings/:listing_id/charge' => 'reservations#charge', as: 'reservation_charge'

  get 'reservations/show_upcoming' => 'reservations#show_upcoming'
  get 'reservations/show_past' => 'reservations#show_past'

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


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
