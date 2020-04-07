class Client
  @@all = []

  # Use an accessor method for init args because clients will move and change their name, etc
  attr_accessor :name, :address, :zone
  
  def initialize name, address, zone
    @name = name
    @address = address
    @zone = zone
    Client.all << self
  end

  def delivery_request recipient, type, service_type 
    Job.new(self, self.address, recipient, type, service_type, Time.now)
  end

  def all_client_jobs
    Job.all.select{ |job| job.client == self }  
  end

  def active_client_jobs
    all_client_jobs.select{ |job| job.active }
  end

  def client_jobs_not_picked
    active_client_jobs.select{ |job| !job.picked }
  end

  def self.all
    @@all
  end
end
