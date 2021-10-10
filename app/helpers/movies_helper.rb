module MoviesHelper
  def  week_reservation
    days = [0,1,2,3,4,5,6]
    d = Time.current
    days.map do |n| 
      week  = d.since(n.days)
      week.strftime("%F")
    end
  end
end
