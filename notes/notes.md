Things to do Tuesday 12/8
  Listings show - search functionality
  Reservations - show page - make it look better
  Reservations - validation, cannot create a reservation past date √
  Club set - gets destroyed when club is destroyed √
  Listing - Remove clubs after their clubset has been reserved, vice versa 
  Profile page - flesh it out
  Supply Clubs show page - make it look pretty √ Kind of
  Welcome page - Put some here
  Paperclip implemention
  Stripe implementation
  OAuth2.0 - Facebook/Google (at least one)
  Club/Club Set - Tests
  Faker data
  Listing Show page - Make look better
  Analytics page

  *** Bonus ***
  Messages between users
  Reviews





Things we broke on merge:
  lazy-loader √
  auto-hide listings on show
  Should remove sets if dependant clubs are deleted.
  Create listings buttons 


*** Navbar √
-Supplier buttons √
-Renter buttons √
Not Signed in: √
[ | Git-a-Club |                            | Supply Clubs | | Listings | | Sign in | ]
Signed in: √
[ | Git-a-Club | | My Rentals | | Supply Clubs | | Listings | | Profile | | Log Out | ]

*** Renter
-Show page
--Up coming listings
--Button to listings index

*** Validations
-Supplier √
--must have address √
--club_sets must be built of clubs of all one gender √
--club_sets must be built of clubs of all one hand √

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
