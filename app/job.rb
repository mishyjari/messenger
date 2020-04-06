class Job
  @@all = []

  attr_reader :client
  attr_accessor :courier, :recipient, :due, :type

  def initialize client, recipient, type, due=Dispatch.standard, ready=Time.now
    @courier = Dispatch.courier
    @client = client
    @recipient = recipient
    @due = due
    @type = type
    @ready = Time.now
    @picked = false
    @active = true
    @drop_time = nil
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

  def self.active_jobs
    Job.all.select{ |job| job.active }
  end

  def self.all
    @@all
  end

end
