class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :not_valid

    def create
        membership = Membership.create!(membership_params)
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def not_valid(invalid)
        render json: { error: membership.errors.full_messages }, status: 422
    end

end
