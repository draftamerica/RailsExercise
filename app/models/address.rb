class Address < ApplicationRecord
  belongs_to :user
  validates :street, :city, :state, :zip, presence: true
  validates :zip, length: { maximum: 5 }
  validates :zip, numericality: true
end
