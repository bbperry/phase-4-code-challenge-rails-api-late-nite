class AppearancesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    end



private

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Appearance not found" }, status: :not_found
    end

    def appearance_params
        params.permit(:episode_id, :guest_id, :rating)
    end    

end
