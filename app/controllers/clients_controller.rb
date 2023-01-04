class ClientsController < ApplicationController

    def show
        client = Client.find_by(id: params[id])
        if client.valid?
            render json: client, status: :found
        else
            render json: {error: "Client not found!"}, status: :not_found 
        end 
    end

end
