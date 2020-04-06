class Courier
  @@all = []

  attr_reader :birthday, :rookie_year
  attr_accessor :name, :status, :active

  def initialize name, birthday, rookie_year
    @name = name
    @birthday = birthday
    @rookie_year = rookie_year
    @active = true
    Courier.all << self
  end
  
  # Get age from birthday
  def age
    # Fix this to account for actual date, not just year
    Time.now.year - birthday.year
  end

  # Get years_experience from rookie_year
  def years_experience
    Time.now.year - rookie_year
  end

  # Get all jobs for this courier
  def jobs
    Job.all.select{ |job| job.courier == self }  
  end

  def active_jobs
    jobs.select{ |job| job.active }
  end

  def not_picked
    jobs.select{ |job| !job.picked }
  end

  # Get an array of job instances currently active for this courier
  def holding
    jobs.select{ |job| job.picked && job.active }
  end
  
  def zones_pending_pick
    not_picked.map{ |job| job.client.zone }
  end

  def zones_pending_drop
    active_jobs.map{ |job| job.client.zone }
  end

  def self.active_couriers
    Courier.all.select{ |courier| courier.active }
  end
  def self.dispatch client, recipient
    # Prefrence mathces, then zones, then clearness
  end

  def self.all
    @@all
  end
end
