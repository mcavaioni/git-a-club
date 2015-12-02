/ #=> pages#welcome

/login #=> sessions#new
/logout #=> sessions#destroy

/signup #=> users#new
/users/:id #=> users#show
/users/:id/listings/index #=> listings#index
/users/:id/listings/new #=> listings#new
/users/:id/clubs #=> CRUD
/users/:id/club_sets #=> CRUD
/users/:id/reservations/index #=> reservation#index

/listings #=> listings#index
/listings/:id #=> listings#show
/listings/:id/reservations/new #=> reservations#new
