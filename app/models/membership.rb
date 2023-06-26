class Membership < ApplicationRecord
  belongs_to :client
  belongs_to :gym

  validates :client_id, :gym_id, :charge, presence: true 
  validates :client_id, uniqueness: true
end
