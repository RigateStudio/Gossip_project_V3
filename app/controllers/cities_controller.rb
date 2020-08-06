class CitiesController < ApplicationController
  def show
    @id = params[:id]
    @city_gossips = []
    @city_users = User.where(city: City.find(@id))
    @city_users.each do |city_user| 
      city_user.gossips.each do |gossip|
        @city_gossips << gossip
      end
    end
  end
end