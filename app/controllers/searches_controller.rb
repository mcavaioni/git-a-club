class SearchesController < ApplicationController

  def listings
    search = Search.new(search_type_params,generic_club_params)
    results = search.get_results
    render json: {results: results}
  end

  private

  def generic_club_params
    params.require(:generic_club).permit(:male, :righty, :club_type => [], :head_feature => [], :shaft_stiffness => [])
  end

  def search_type_params
    params.require(:search_type)
  end

end
