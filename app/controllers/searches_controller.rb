class SearchesController < ApplicationController

  def listings
    search = Search.new(search_type_params,generic_club_params)
    listings_array = search.get_results
    listings_json = ListingsJsonViewObject.new(listings_array).collect_listings_json
    render json: listings_json
  end

  private

  def generic_club_params
    params.require(:generic_club).permit(:male, :righty, :club_type => [], :head_feature => [], :shaft_stiffness => [])
  end

  def search_type_params
    params.require(:search_type)
  end

end
