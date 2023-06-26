class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    client = finder
    render json: client, status: :ok, except: [:created_at, :updated_at], include: { memberships: { except: [:created_at, :updated_at] } }
  end

  private

  def finder
    client = Client.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Client Not Found" }, status: :not_found
  end
end
