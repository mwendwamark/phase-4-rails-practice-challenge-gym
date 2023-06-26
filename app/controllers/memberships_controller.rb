class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def create
    new_membership = Membership.create!(membership_params)
    render json: new_membership, status: :created 
  end

  private

  def render_not_found_response
    render json: { error: "Membership Not Found" }, status: :not_found
  end

  def membership_params
    params.permit(:charge, :client_id, :gym_id, :id)
  end
end
