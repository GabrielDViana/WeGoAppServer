class SearchesController < ApplicationController
  def create
    @search = Search.create(search_params)
    @search = Search.find(search_params)
    render :json => @search.to_json(:include => [:user, :users] )
  end

  private
    def search_params
      params.require(:search).permit(:keywords, :average_rating, :latitude,
        :longitude, :distance)
    end
end
