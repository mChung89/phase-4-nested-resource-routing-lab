class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :render_no_found_response

    private

    def render_no_found_response
        render json: {error: "Item not found" }, status: :not_found
    end
end
