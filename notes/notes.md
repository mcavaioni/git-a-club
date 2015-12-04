/ #=> pages#welcome - √

/login #=> sessions#new - HM √
/logout #=> sessions#destroy - HM √

/signup #=> users#new - HM √
/users/:id #=> users#show - AJ
/users/:id/listings/index #=> listings#index -HM
/users/:id/listings/new #=> listings#new - HM √
/users/:id/clubs #=> CRUD - AJ 
/users/:id/club_sets #=> CRUD - AJ
/users/:id/reservations/index #=> reservation#index -AJ

/listings #=> listings#index - HM √
/listings/:id #=> listings#show - HM √
/listings/:id/reservations/new #=> reservations#new - HM
