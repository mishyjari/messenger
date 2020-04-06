class Job
  @@all = []

  attr_reader :client
  attr_accessor :courier, :recipient, :due, :type, :active

  def initialize client, recipient, type, service_type, ready=Time.now
    @courier = nil
    @client = client
    @recipient = recipient
    @type = type
    @ready = Time.now
    @picked = false
    @active = true
    @drop_time = nil
    case service_type
      when Time
        @due = service_type
      when 'standard'
        t = Time.now
        @due = Time.new(t.year,t.month,t.day,t.hour+3,t.min,t.sec)
      when 'rush'
        t = Time.now
        @due = Time.new(t.year,t.month,t.day,t.hour+1,t.min,t.sec)
    end
    Job.all << self
  end

  def complete time=Time.now
    self.drop_time = time
    self.active = false
    'Job Comnplete'
  end

  def pickup time=Time.now
    self.picked = time
  end

  def assign_job courier
    self.courier = courier
  end

  def self.unassigned_jobs
    Job.active_jobs.select{ |job| !job.courier }
  end

  def self.active_jobs
    Job.all.select{ |job| job.active }
  end

  def self.all
    @@all
  end

end
