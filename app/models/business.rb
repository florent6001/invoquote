class Business < ApplicationRecord
  belongs_to :user

  validates :name, :address, :registration_number, :tax_rate, presence: true
end
