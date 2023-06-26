class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def show 
        gym = finder 
        render json: gym 
    end

    private 

    def render_not_found_response 
        render json: { error: "Gym not Found"}
    end

    def finder 
        gym = Gym.find(params[:id])
    end
end
