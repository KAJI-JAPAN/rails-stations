class Reservation < ApplicationRecord
  belongs_to :sheet
  belongs_to :schedule
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :date, presence: true, uniqueness: {scope: :sheet_id }
  validates :schedule_id, presence: true
  validates :sheet_id, presence: true
end
