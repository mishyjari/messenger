class Job
  @@all = []
  def self.all
    @@all
  end

  attr_accessor :client, :pick, :drop, :pkg_type, :svc_type, :time_ready, :courier, :completed, :picked, :due, :pod, :drop_time

  def initialize client, pick, drop, pkg_type, svc_type, time_ready=Time.now#, due=due
    @client = client
    @pick = pick
    @drop = drop
    @pkg_type = pkg_type
    @svc_type = svc_type
    @time_ready = time_ready
    @courier = nil
    @completed = false
    @picked = false
    @pod = nil
    @drop_time = nil
    Job.all << self
  end
  
  def due
    svc = self.svc_type
    case svc
      when 'economy'
        time_ready + 5.hours
      when 'standard'
        time_ready + 3.hours
      when 'rush'
        time_ready + 2.hours
      when 'direct'
        time_ready + 1.hour
    end
  end

  # Some methods to hand analytics

  def self.active_jobs
    Job.all.select { |job| !job.completed }
  end

  def self.unassigned_jobs
    active_jobs.select { |job| !job.courier }
  end

  def self.not_picked_up # assigned but havend been picked
    active_jobs.select { |job| job.courier && !job.picked }
  end

  # Instance methods
  
  def assign_job courier
    self.courier = courier
  end

  def mark_picked
    self.picked = true
  end

  def mark_complete pod, time=Time.now
    self.pod = pod
    self.drop_time = time
    self.completed = true
  end
end
