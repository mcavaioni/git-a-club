*** Navbar
-Supplier buttons
-Renter buttons
Not Signed in:
[ | Git-a-Club |                            | Supply Clubs | | Listings | | Sign in | ]
Signed in:
[ | Git-a-Club | | My Rentals | | Supply Clubs | | Listings | | Profile | | Log Out | ]

*** Renter
-Show page
--Up coming listings
--Button to listings index

*** Validations
-Supplier
--must have address

-Clubs

-Clubs Sets
--Club is rented that is apart of a club set, club set must disable

-Listings √
--reservation times √


*** BONUS ***

ActionMailer!! 

Google Maps

##########################################################################################

/ #=> pages#welcome - √

/login #=> sessions#new - HM √
/logout #=> sessions#destroy - HM √

/signup #=> users#new - HM √
/users/:id #=> users#show - AJ
/users/:id/listings/index #=> listings#index -AJ
/users/:id/listings/new #=> listings#new - AJ
/users/:id/clubs #=> CRUD - AJ
/users/:id/club_sets #=> CRUD - AJ
/users/:id/reservations/index #=> reservation#index -AJ

/listings #=> listings#index - HM √
/listings/:id #=> listings#show - HM √
/listings/:id/reservations/new #=> reservations#new - HM 
