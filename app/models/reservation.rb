class Reservation < ApplicationRecord
  belongs_to :sheet
  belongs_to :schedule
end
