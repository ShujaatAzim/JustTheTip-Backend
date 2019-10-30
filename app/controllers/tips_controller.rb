class TipsController < ApplicationController

    def index 
        @tips = Tip.all
        render json: @tips.to_json(:include => {:restaurant => {:except => [:created_at, :updated_at]}}, :except => [:restaurant_id, :created_at, :updated_at])
    end

    def show
        @tip = Tip.find(params[:id])
        render json: @tip.to_json(:include => {:restaurant => {:except => [:created_at, :updated_at]}}, :except => [:restaurant_id, :created_at, :updated_at])
    end

    def new
        @tip = Tip.new
    end

    def create
        @tip = Tip.new(tip_params)
        @tip.save
        render json: @tip.to_json()
    end

    def update
        @tip = Tip.find(params[:id])
        @tip.update_attributes(tip_params)
        render json: @tip.to_json()
    end

    def delete
        @tip = Tip.find(params[:id])
        @tip.destroy
    end

    private

    def tip_params
        params.require(:tip).permit(:amount, :date, :restaurant)
    end

end
