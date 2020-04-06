class Dispatch

  # Pick a random courier
  def self.courier
    Courier.active_couriers[rand(Courier.active_couriers.length)]
  end

  # Helper methods for getting due times for default delivery times
  def self.standard
    t = Time.now
    Time.new(t.year,t.month,t.day,t.hour+3,t.min,t.sec)
  end

  def self.rush
    t = Time.now
    Time.new(t.year,t.month,t.day,t.hour+2,t.min,t.sec)
  end

  def self.super_rush
    t = Time.now
    Time.new(t.year,t.month,t.day,t.hour+1,t.min,t.sec)
  end

end
