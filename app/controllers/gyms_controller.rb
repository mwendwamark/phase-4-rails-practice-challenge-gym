class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    gym = finder
    render json: gym, except: [:created_at, :updated_at], include: { memberships: { except: [:created_at, :updated_at] } }, status: :ok
  end

  def delete
    delete_gym = finder
    delete_gym.destroy
    head :no_content
  end

  private

  def render_not_found_response
    render json: { error: "Gym Not Found Please Try Another Gym" }
  end

  def finder
    gym = Gym.find(params[:id])
  end
end
