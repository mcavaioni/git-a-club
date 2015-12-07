class SearchesController < ApplicationController

  def listings
    search_query = params[:q]
    Search.new(search_query)
    binding.pry
  end

end
