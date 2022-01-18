class EpisodesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        render json: Episode.all
    end

    def show
        episode = find_episode
        render json: episode.to_json(include: :guests)
    end

    def destroy
        episode = find_episode
        episode.destroy
        head :no_content
    end



private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Episode not found" }, status: :not_found
    end

    def find_episode
        Episode.find(params[:id])
    end





end
