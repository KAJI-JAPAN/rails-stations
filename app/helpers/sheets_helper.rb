module SheetsHelper
  def reservation_list(sheet)
      Reservation.exists?(sheet_id: "#{sheet}")
  end
end
