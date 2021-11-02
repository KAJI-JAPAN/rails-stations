module ApplicationHelper
  def  week_reservation
    days = [0,1,2,3,4,5,6]
    d = Time.current
    days.map do |n| 
      week  = d.since(n.days)
      week.strftime("%F")
    end
  end

  def reservation_list(sheet)
    available_sheet = Reservation.exists?(sheet_id: "#{sheet}")
    available_schedule = Reservation.exists?(schedule_id: "#{sheet}")
    available_sheet && available_schedule
end


  def select_sheet
    all_sheet = Sheet.all
    all_sheet.map do |sheet| 
      if !reservation_list(sheet.id)
         sheet.id
      end
    end.compact do |sheet|
      sheet.id
    end
  end
end
