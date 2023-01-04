class GymsController < ApplicationController

    def show
        gym = Gym.find_by(id: params[id])
        if gym.valid?
            render json: gym, status: :found
        else
            render json: {error: "Gym not found!"}, status: :not_found 
        end 
    end

    def destroy
        gym = Gym.find_by(id: params[id])
        if gym.valid?
            gym.destroy
            head :no_content
        else
            render json: {error: "Gym not found!"}, status: :not_found
        end
    end


end
