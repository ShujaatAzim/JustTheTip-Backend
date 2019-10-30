class RestaurantsController < ApplicationController

    def index
        @restaurants = Restaurant.all
        render json: @restaurants.to_json(:include => {:tips => {:except => [:restaurant_id, :created_at, :updated_at]}}, :except => [:created_at, :updated_at])
    end

    def show
        @restaurant = Restaurant.find(params[:id])
        render json: @restaurant.to_json(:include => {:tips => {:except => [:restaurant_id, :created_at, :updated_at]}}, :except => [:created_at, :updated_at])
    end

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save
        render json: @restaurant.to_json()
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.update_attributes(restaurant_params)
        render json: @restaurant.to_json()
    end

    def delete
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
    end


    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :location)
    end

end